class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
   rootViewController = UIViewController.alloc.init
   rootViewController.title = 'Boxey'
   rootViewController.view.backgroundColor = UIColor.whiteColor

   navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

   @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
   @window.rootViewController = navigationController
   @window.makeKeyAndVisible

   @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
   @window.makeKeyAndVisible
   @blue_view = UIView.alloc.initWithFrame(CGRect.new([10,10], [100,100]))
#   @blue_view.backgroundColor = UIColor.blueColor
   @blue_view.backgroundColor = color(rand_color)
   @window.addSubview(@blue_view)
   @add_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
   @add_button.setTitle("Add", forState:UIControlStateNormal)
   @add_button.sizeToFit
   @add_button.frame = CGRect.new([10, @window.frame.size.height - 10 - @add_button.frame.size.height], @add_button.frame.size)
   @window.addSubview(@add_button)
   @add_button.addTarget( self, action:"add_tapped", forControlEvents:UIControlEventTouchUpInside)

    @red_view = UIView.alloc.initWithFrame(CGRect.new([10,10], [80,80]))
#    @red_view.backgroundColor = UIColor.redColor
    @red_view.backgroundColor =  color(rand_color)
    @blue_view.addSubview(@red_view)

    @green_view = UIView.alloc.initWithFrame(CGRect.new([10,10], [60,60]))
#    @green_view.backgroundColor = UIColor.greenColor
     @green_view.backgroundColor = color(rand_color)
    @red_view.addSubview(@green_view)

    @orange_view = UIView.alloc.initWithFrame(CGRect.new([10,10], [40,40]))
#    @orange_view.backgroundColor = UIColor.orangeColor
     @orange_view.backgroundColor = color(rand_color)
    @green_view.addSubview(@orange_view)

    @yellow_view = UIView.alloc.initWithFrame(CGRect.new([10,10], [20,20]))
#    @yellow_view.backgroundColor = UIColor.yellowColor
    @yellow_view.backgroundColor = color(rand_color)
    @orange_view.addSubview(@yellow_view)

    @new_blue_view = UIView.alloc.initWithFrame(CGRect.new([5,5], [10,10]))
#    @new_blue_view.backgroundColor = UIColor.blueColor
    @new_blue_view.backgroundColor =  color(rand_color)
    @yellow_view.addSubview(@new_blue_view)
 
    true
  end

  def color(color_string, alpha = 1.0)
   red   = color_string[0,2].hex
   green = color_string[2,2].hex
   blue  = color_string[4,2].hex
   red_percent   = red.to_f / 255
   green_percent = green.to_f / 255
   blue_percent  = blue.to_f / 255
   return UIColor.colorWithRed(red_percent, green:green_percent, blue:blue_percent, alpha:alpha)
  end

  def rand_color
    r = rand(255).to_s(16)
    g = rand(255).to_s(16)
    b = rand(255).to_s(16)
    r, g, b = [r, g, b].map { |s| if s.size == 1 then '0' + s else s end }
    return r + g + b
  end

  def add_tapped
    new_view = UIView.alloc.initWithFrame(CGRect.new([0,0], [80,80]))
    new_view.backgroundColor = color(rand_color)
    last_view = @window.subviews[0]
    new_view.frame = CGRect.new([last_view.frame.origin.x, last_view.frame.origin.y + last_view.frame.size.height + 5], last_view.frame.size)
    if last_view.frame.origin.y > 220.0
      puts "inside loop"
      puts ""
      new_view.frame = CGRect.new([new_view.frame.origin.x + last_view.frame.size.height + 5, new_view.frame.origin.y - last_view.frame.origin.y - last_view.frame.size.height + 5], last_view.frame.size)
    end
    if last_view.frame.origin.x > 220.0
       @alert =
          UIAlertView.alloc.initWithTitle("Error!", 
          message: "Out of Bounds",
          delegate: nil,
          cancelButtonTitle: "OK",
          otherButtonTitles: nil)
       @alert.show
    end
    @window.insertSubview(new_view, atIndex:0)
  end
end
