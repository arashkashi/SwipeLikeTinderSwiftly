Have simple tinder like swipe UI mechanics in iOS written in swift. 

The code is based on the word of https://github.com/cwRichardKim/TinderSimpleSwipeCards.

Take note of the example project.

![alt tag](https://github.com/arashkashi/SwipeLikeTinderSwiftly/blob/master/swipe2.gif)

```javascript
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the container
        var swipablecontainer = SwipableViewContainer(frame: self.view.frame)
        self.view.addSubview(swipablecontainer)
        
        // Create views
        var firstcardView = UIView(frame: CGRectMake(0, 0, 100, 100))
        firstcardView.backgroundColor = UIColor.redColor()
        
        var secondCardView = UIView(frame: CGRectMake(0, 0, 100, 100))
        secondCardView.backgroundColor = UIColor.blueColor()
        
        var thirdCardView = UIView(frame: CGRectMake(0, 0, 100, 100))
        thirdCardView.backgroundColor = UIColor.orangeColor()
        
        // Enqueue the views
        swipablecontainer.enqueue(firstcardView)
        swipablecontainer.enqueue(secondCardView)
        swipablecontainer.enqueue(thirdCardView)
    }
}
```
