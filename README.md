# Pre-work - *iOS Tip Calculator App*

**iOS Tip Calculator** is a tip calculator application for iOS devices.

Submitted by: **Bryan Santos**

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, select a tip percentage, and see the tip and total values.
* [x] User can select between multiple tip percentages by tapping different values on a segmented control, updating the tip value accordingly.

The following **additional** features have also been implemented:

* [x] User has constant access to a numeric keypad for entering the bill amount. 
* [x] User can access a Settings screen for additional functionality.
* [x] User can utilize a slider to create a custom tip value.
* [x] User can determine a party size for splitting the total.
* [x] User can toggle Dark Mode.

## Video Walkthrough

Here is a walkthrough of the implemented user stories:

<img src='https://github.com/bryandevelops/iOS-Tip-Calculator-App/blob/main/demo.gif' title='Video Walkthrough' width='400' alt='Video Walkthrough' />
<!-- ![Tip Calculator Demo](https://github.com/bryandevelops/iOS-Tip-Calculator-App/blob/main/demo.gif) -->

## Notes

One of the biggest challenges I encountered while building this app was getting accustomed to the Xcode IDE. iOS and Mobile app development in general is not something I've ever done before prior to this project, which meant I had to take my time to familiarize myself with this new work environment. I love how intuitive adding UI elements is because of the object library. Dragging-and-dropping UI objects and connecting them to the ViewController made development a lot more fluent than expected, and it makes me excited about learning what else is possible in the world of iOS app development. 

A more specific challenge I would say was getting values to persist when changing Views. So for example, setting the custom tip slider to a 10% tip in the Settings, going back to the home page to see the updated tip, but then being able to enter back into the Settings to see the tip slider still display the 10% tip. This is very simple and fundamental to any app, but this being my first time dabbling in iOS development, it took me some time having to sift through Swift documentation to learn about UserDefaults and how they work. Once I figured this out, the time spent coding some of the other features was much shorter.

```
@IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        let defaults = UserDefaults.standard
        
        tipPercentage.text = "\(currentValue)%"
        defaults.set(Double(currentValue), forKey: "myInt")
        defaults.synchronize()
}
```

## License

    Copyright [2021] [Bryan Santos]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
