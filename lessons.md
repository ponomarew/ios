
# Lesson 1 — Intro to Swift & SwiftUI

## Goal of the lesson

After this lesson the student should be able to:

* understand basic Swift syntax
* use `var` / `let`
* work with simple data types (String, Int, Double, Bool)
* write simple functions
* understand the concept of state in SwiftUI
* build a very simple UI using `@State`, `Text`, `Button`, `VStack`

---

# 1. Introduction to Swift & Xcode

### Key points:

* Swift is a modern safe language used for iOS development.
* Xcode is the main tool for writing, testing, and running apps.
* SwiftUI is a declarative UI framework where UI updates automatically when data changes.

### Steps:

1. Open Xcode → File → New → Project
2. Select **iOS App**
3. Interface: **SwiftUI**
4. Language: **Swift**

### Default SwiftUI code:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
            .padding()
    }
}
```

Run the app in the simulator to confirm everything works.

---

# 2. Swift Basics

This block should be shown in a **Playground**.

### Variables & constants

```swift
var name = "Alex"
let age = 21
var temperature: Double = 36.5
var isOnline = true
```

### Simple functions

```swift
func greet(_ name: String) -> String {
    "Hello, \(name)"
}
```

### Function with logic

```swift
func mood(for value: Int) -> String {
    if value < 0 { return "Negative" }
    if value == 0 { return "Neutral" }
    return "Positive"
}
```

---

# 3. First SwiftUI Screen

### Concept:

> SwiftUI = UI as a function of **state**.
> When state changes, UI updates automatically.

### Example:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(count)")
                .font(.largeTitle)

            Button("Increase") {
                count += 1
            }
        }
        .padding()
    }
}
```

### Adding logic from Swift:

```swift
func mood() -> String {
    if count < 0 { return "Negative" }
    if count == 0 { return "Neutral" }
    return "Positive"
}
```

### Display mood in UI:

```swift
Text(mood())
    .foregroundColor(
        count < 0 ? .red :
        (count > 0 ? .green : .gray)
    )
```

---

# 4. Homework — Mood Counter v1 (due via Pull Request)

Create a simple SwiftUI app with:

### Requirements:

1. `@State var count = 0`
2. Three buttons:

   * **+1**
   * **–1**
   * **Reset** → sets count back to 0
3. A text showing the current value:

   ```
   Value: X
   ```
4. A function:

   ```swift
   func mood() -> String
   ```

   returning:

   * "Negative"
   * "Neutral"
   * "Positive"
5. Mood text color:

   * red if count < 0
   * gray if count == 0
   * green if count > 0

---

## ✔️ End of Lesson 1
