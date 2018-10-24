# UIAlertControllerDimmed

Subclasses UIAlertController and turns the background black and white.

## Usage

### Standard UIAlertController

```swift
let alertController: UIAlertController = UIAlertController(title: nil, message: "Message", preferredStyle: .alert)
alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
present(alertController, animated: true, completion: nil)
```

### UIAlertControllerDimmed

```swift
let alertController: UIAlertControllerDimmed = UIAlertControllerDimmed(title: nil, message: "Message", preferredStyle: .alert)
alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
alertController.presentWithGrayBackground()
```

Simply use `UIAlertControllerDimmed` instead of `UIAlertController` and call `presentWithGrayBackground`.


[SO question that led to that repo](https://stackoverflow.com/questions/52932418/uialertcontroller-does-not-turn-all-elements-in-the-background-to-b-w)
