Have simple tinder like swipe UI mechanics in iOS written in swift. 

The code is based on the word of https://github.com/cwRichardKim/TinderSimpleSwipeCards.

Take note of the example project.

Call backs could be easily added as you please. I intentionally kept it as lean as possible.

![alt tag](https://github.com/arashkashi/SwipeLikeTinderSwiftly/blob/master/swipe2.gif)

```javascript
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create views
        var firstcardView = UIView(frame: CGRectMake(0, 0, 100, 100))
        firstcardView.backgroundColor = UIColor.redColor()
        
        var secondCardView = UIView(frame: CGRectMake(0, 0, 100, 100))
        secondCardView.backgroundColor = UIColor.blueColor()
        
        var thirdCardView = UIView(frame: CGRectMake(0, 0, 100, 100))
        thirdCardView.backgroundColor = UIColor.orangeColor()
        
        // Add the container
        var swipablecontainer = SwipableViewContainer(frame: self.view.frame)
        self.view.addSubview(swipablecontainer)
        
        // Enqueue the views
        swipablecontainer.enqueue(firstcardView)
        swipablecontainer.enqueue(secondCardView)
        swipablecontainer.enqueue(thirdCardView)
    }
}
```
