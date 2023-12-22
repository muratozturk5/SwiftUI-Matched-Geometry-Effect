# SwiftUI Matched Geometry Effect

Forked from [SwiftUI Matched Geometry Effect]() by Murat ÖZTÜRK.

An example iPhone, iPad, and Mac app that demonstrates how to use SwiftUI’s [matchedGeometryEffect()](https://developer.apple.com/documentation/swiftui/view/matchedgeometryeffect(id:in:properties:anchor:issource:)) view modifier to animate transitions.

After months of trying to get Matched Geometry Effect working properly in one of my personal projects, I ran across Murat’s public project which animated SwiftUI views exactly the way I wanted my project to animate: from a list view to a detail view.

There are very few Matched Geometry Effect examples that animate multi-view (text, pictures, backgrounds, shapes) list views to detail views. Most only work on a single shape or image, or don’t transition from list to detail views. Those that did seemed to be overly complex.

Although Murat’s code worked perfectly, it hard-coded each list item, so it wasn’t dynamic or scalable. So I updated the code to make sure it would work from a loop.

Actually I made a lot of changes...

## 🔧 Changes from Murat’s Original Project

##### Cleaned up the code:
* Each view modifier on a new line.
* Deleted unused test files.
* Added spaces after commas.
* Updated previews to the new `#Preview` macro.

##### Cleaned up the Assets file:
* Removed the 1.2Mb background image.
* Fixed the name of the “BAckground 2” image asset.
* Renamed the image file names.
* Change the images to _Single Scale_.
* Removed the unused “Secondary” color.

##### Fixed some UI bugs:
* Clipped list items views using the `.contentShape()` modifier so they don't intercept taps on nearby list items.
* Detail text views no longer overlap at accessible type sizes.

##### Improved the architecture:
* Used a loop in the list view so the data can be scaled to any number items.
* Added data model.
* Added an array of sample data.
* Reduce to a single animation namespace.

##### Made some interace improvements:
* The status bar is now hidden in the detail view on iOS so the close button can be better placed.
* Removed the unsightly rectangular button background behind the close button in the detail view on macOS.
* The list view now uses multiple columns when space is available (macOS, iPad, and landscape iPhone).
* Disabled tab bar and multiple windows on macOS.
* Added an app icon.

##### Did some housekeeping:
* Shortened the project name to just “MatchedGeometryEffect”.
* Added a “.gitignore” file.
* Combined the macOS and iOS targets into a single target and removed the unnecessary _Designed for iPad_ compatibility destination.
* Removed the code file header comments.
* Set minimum iOS to 15.0.
* Set minimum macOS to 13.0.
* Removed the unused “MatchedView.swift” file.
* Improved the sample data descriptions (was just “Description”).
* Added the required image attribution for the sample images to the “Data.swift” file and this ReadMe.


## 🐞 Issues

Most of my failed attempts to use the matchedGeometryEffect() modifier included efforts to avoid seeing this warning in the Xcode console:

```
Multiple inserted views in matched geometry group ... have `isSource: true`, results are undefined.
```

It turns out that the only way I was able to get the desired animation was to stop worrying about the `isSource` parameter and just live with this warning.

---

I also get this warning if the Lorem Ipsum text is too long:

```
<decode: bad range for [%{public}s] got [offs:274 len:1173 within:0]>
```

I wasn’t able to figure out what was causing this, so I just used less Lorem Ipsum text for the sample details field. It still seems to be too long on macOS, but not on iOS. Let me know if you know what’s causing this.

## 👨 Original Sample App Developed By 

<img src="https://avatars.githubusercontent.com/u/62841905?s=400&u=6b1f97cf6a3dfe668719000f9686f5fe861f273a&v=4" width="70" align="left">

**Murat ÖZTÜRK**

[![Linkedin](https://img.shields.io/badge/-linkedin-grey?logo=linkedin)](https://www.linkedin.com/in/murat-%C3%B6zt%C3%BCrk-7a9306217/)

## 📄 License

```text
MIT License

Copyright (c) 2022 Murat ÖZTÜRK

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

Sample images courtesy of [Vecteezy.com](https://www.vecteezy.com/).
