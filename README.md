# DSImageViewRound
iOS图片高性能设置圆角

一般我们在iOS开发的过程中设置圆角都是如下这样设置的。

     avatarImageView.clipsToBounds = YES;
     [avatarImageView.layer setCornerRadius:50];
     
     这样设置会触发离屏渲染，比较消耗性能。比如当一个页面上有十几头像这样设置了圆角
     会明显感觉到卡顿。
     
     注意：ios9.0之后对UIImageView的圆角设置做了优化，UIImageView这样设置圆角
     不会触发离屏渲染，ios9.0之前还是会触发离屏渲染。而UIButton还是都会触发离屏渲染。

------

所有如果要高性能的设置圆角就需要找另外的方法了。下面是我找到的一些方法并写了一个例子。[github源码](https://github.com/walkdianzi/DSImageViewRound/tree/master)

![IMG_1802.PNG](http://upload-images.jianshu.io/upload_images/101810-a4dbf287a34ed2f4.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**设置圆角的方法**

- 直接使用setCornerRadius
      这种就是最常用的，也是最耗性能的。

- setCornerRadius设置圆角之后，shouldRasterize=YES光栅化

      avatarImageView.clipsToBounds = YES;
      [avatarImageView.layer setCornerRadius:50];
      avatarImageView.layer.shouldRasterize = YES;
      
      shouldRasterize=YES设置光栅化，可以使离屏渲染的结果缓存到内存中存为位图，
      使用的时候直接使用缓存，节省了一直离屏渲染损耗的性能。

      但是如果layer及sublayers常常改变的话，它就会一直不停的渲染及删除缓存重新
      创建缓存，所以这种情况下建议不要使用光栅化，这样也是比较损耗性能的。

      问题：我发现UIImageView上加载网络图片使用光栅化会有一点模糊，而UIButton
      上使用光栅化没有模糊，不知道为什么？求大神解答！


- 直接覆盖一张中间为圆形透明的图片
      这种方法就是多加了一张透明的图片，GPU计算多层的混合渲染blending也是会消耗
      一点性能的，但比第一种方法还是好上很多的。

- Core Graphics绘制圆角
      这种方式性能最好，但是UIButton上不知道怎么绘制，可以用UIimageView添加个
      点击手势当做UIButton使用。

      UIGraphicsBeginImageContextWithOptions(avatarImageView.bounds.size, NO, [UIScreen mainScreen].scale);
      [[UIBezierPath bezierPathWithRoundedRect:avatarImageView.bounds cornerRadius:50] addClip];
      [image drawInRect:avatarImageView.bounds];
      avatarImageView.image = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();

      这段方法可以写在SDWebImage的completed回调里，也可以在UIImageView+WebCache.h
      里添加一个方法，isClipRound判断是否切圆角，把上面绘制圆角的方法封装到里面。
      - (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options isClipRound:(BOOL)isRound progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock;
-------

**使用Instruments的Core Animation查看性能**
- Color Offscreen-Rendered Yellow
开启后会把那些需要离屏渲染的图层高亮成黄色，这就意味着黄色图层可能存在性能问题。

- Color Hits Green and Misses Red
如果shouldRasterize被设置成YES，对应的渲染结果会被缓存，如果图层是绿色，就表示这些缓存被复用；如果是红色就表示缓存会被重复创建，这就表示该处存在性能问题了。

用Instruments测试得
- 第一种方法，ios9.0之前UIImageView和UIButton都高亮为黄色。ios9.0之后只有UIButton高亮为黄色。

- 第二种方法UIImageView和UIButton都高亮为绿色，但UIImageView加载网络图片后会有一点模糊

- 第三种方法无任何高亮，说明没离屏渲染

- 第四种方法无任何高亮，说明没离屏渲染
