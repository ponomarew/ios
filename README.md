# Homework Submission Instructions

1. **Fork** the repository.  
2. Create a folder using this path:  
   ```
   homework -> lesson (lesson number) -> your_name -> your_homework
   ```
   Example:  
   ```
   homework/lesson2/john_doe/todo_app/
   ```
3. Put your homework project into your folder.  
4. Create a **Pull Request** to the main repository.  
5. I will review your PR and leave comments.

---

# Table of Contents

- [Lesson 1 — Intro to Swift & SwiftUI](#lesson-1--intro-to-swift--swiftui)
- [Lesson 2 — SwiftUI Views, Layout & State](#lesson-2--swiftui-views-layout--state)
- [Lesson 3 — Lists & Navigation](#lesson-3--lists--navigation)

---

# Lesson 1 — Intro to Swift & SwiftUI

<a id="goal-of-the-lesson-1"></a>
## Goal of the lesson

After this lesson the student should be able to:

* understand basic Swift syntax
* use `var` / `let`
* work with simple data types (String, Int, Double, Bool)
* write simple functions
* understand the concept of state in SwiftUI
* build a very simple UI using `@State`, `Text`, `Button`, `VStack`

---

## 1. Introduction to Swift & Xcode

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

## 2. Swift Basics

This block should be shown in a **Playground**.

### Key points:

* Use `var` for variables, `let` for constants.
* Basic types: `String`, `Int`, `Double`, `Bool`.
* Functions use `func` keyword.

### Examples:

```swift
var name = "Alex"
let age = 21
var temperature: Double = 36.5

func greet(_ name: String) -> String {
    "Hello, \(name)"
}

func mood(for value: Int) -> String {
    if value < 0 { return "Negative" }
    if value == 0 { return "Neutral" }
    return "Positive"
}
```

---

## 3. First SwiftUI Screen

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

---

## 4. Homework — Mood Counter v1 (due via Pull Request)

Create a simple SwiftUI app with:

### Requirements:

1. `@State var count = 0`
2. Three buttons:

   * **+1** → increases count by 1
   * **–1** → decreases count by 1
   * **Reset** → sets count back to 0
3. A text showing the current count value:

   ```
   Value: X
   ```
   (where X is the current count number)
4. A function:

   ```swift
   func mood() -> String
   ```

   that returns:
   * "Negative" if count < 0
   * "Neutral" if count == 0
   * "Positive" if count > 0
5. Display the mood result in a separate `Text` view:

   ```
   Mood: [result of mood() function]
   ```
   
   The mood text color should change based on count:
   * red if count < 0
   * gray if count == 0
   * green if count > 0

---

## 5. Resources

* Apple Docs: Swift Basics
* SwiftUI Tutorials
* Xcode documentation

---

# Lesson 2 — SwiftUI Views, Layout & State  

<a id="goal-of-the-lesson-2"></a>
## Goal of the lesson

By the end of this lesson, the student should be able to:

* Understand declarative UI in SwiftUI
* Use `VStack`, `HStack`, `ZStack`
* Apply SwiftUI modifiers
* Use SF Symbols with `Image(systemName:)`
* Work with `@State`
* Use `ForEach` to iterate over collections
* Build simple interactive components  

---

## 1. Declarative UI

### Concept:

> UI = function of state, UI automatically updates when state changes.

### Example:

```swift
struct ExampleView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Toggle("Switch", isOn: $isOn)
            Text(isOn ? "Enabled" : "Disabled")
                .font(.title)
        }
        .padding()
    }
}
```

---

## 2. Layout Containers

### Key points:

* `VStack` arranges views vertically.
* `HStack` arranges views horizontally.
* `ZStack` layers views on top of each other.

### Examples:

```swift
VStack(spacing: 16) {
    Text("Hello")
    Text("World")
}

HStack {
    Text("Left")
    Spacer()
    Text("Right")
}

ZStack {
    Color.blue
    Text("On top")
        .foregroundColor(.white)
}
```

---

## 3. Modifiers

### Key points:

* Order matters; modifiers return new views.

### Example:

```swift
Text("Hello")
    .font(.title)
    .padding()
    .background(Color.yellow)
    .cornerRadius(12)
```

---

## 4. SF Symbols

### Concept:

> SF Symbols is Apple's icon library with thousands of built-in symbols. Use `Image(systemName:)` to display them.

### Key points:

* SF Symbols are vector icons that scale perfectly.
* Use `Image(systemName: "symbol-name")` to display a symbol.
* You can customize size, color, and weight with modifiers.
* Browse symbols in Xcode: Editor → Add SF Symbol, or visit [developer.apple.com/sf-symbols](https://developer.apple.com/sf-symbols)

### Example:

```swift
HStack {
    Image(systemName: "star.fill")
        .foregroundColor(.yellow)
    Image(systemName: "heart")
        .foregroundColor(.red)
    Image(systemName: "circle")
        .foregroundColor(.blue)
}
```

Common symbols: `"circle"`, `"checkmark"`, `"star.fill"`, `"heart"`, `"plus"`, `"minus"`, `"trash"`

---

## 5. @State

### Concept:

> `@State` stores view-local state and triggers UI updates.

### Example:

```swift
struct NameView: View {
    @State private var name = ""
    @State private var isVisible = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Show Greeting") {
                isVisible = true
            }
            .buttonStyle(.borderedProminent)
            
            if isVisible {
                Text("Hello, \(name.isEmpty ? "Guest" : name)!")
                    .font(.title)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}
```

---

## 6. ForEach

### Concept:

> `ForEach` iterates over collections and creates views for each element. It's used to display dynamic lists.

### Key points:

* `ForEach` requires each element to have a unique identifier (`id`).
* Use `id: \.self` for simple types like `String`.
* Works inside containers like `VStack`, `HStack`, or `List`.

### Example:

```swift
struct ContentView: View {
    @State private var items = ["Task 1", "Task 2", "Task 3"]
    
    var body: some View {
        VStack {
            ForEach(items, id: \.self) { item in
                HStack {
                    Image(systemName: "circle")
                    Text(item)
                }
                .padding()
            }
        }
    }
}
```

---

## 7. Homework — Mini To-Do List App

Create a simple SwiftUI app with:

### Requirements:

#### 1. State Management

* Use `@State private var items: [String] = []` to store the list of tasks
* Use `@State private var newTask: String = ""` to store the current input text

#### 2. Layout Structure

* **VStack**: Use as the main container for the entire screen (contains input section and tasks list)
* **HStack**: 
  * Use one `HStack` for the input section (TextField + "Add" button)
  * Use `HStack` inside `ForEach` for each task row (SF Symbol + task text)
* **ZStack**: Use to add a background color or decorative element (optional but encouraged)

#### 3. Input Section

* **TextField**: For entering new tasks, bound to `newTask` state
* **Button**: "Add" button that:
  * Adds `newTask` to `items` array
  * Clears the `newTask` field after adding
  * Only adds if `newTask` is not empty

#### 4. Tasks List

* **ForEach**: Use `ForEach(items, id: \.self)` to iterate over tasks
* Each task row must contain:
  * **HStack** with:
    * **SF Symbol**: Use `Image(systemName:)` (e.g., "circle", "checkmark.circle", "list.bullet")
    * **Text**: Display the task string

#### 5. Styling (Modifiers)

Apply modifiers to create a clean layout:

* Use `.padding()` on containers
* Use `.cornerRadius()` on task rows or background
* Use `.background()` with colors (e.g., `Color.gray.opacity(0.1)`)
* Use `.foregroundColor()` on SF Symbols
* Use `.textFieldStyle(.roundedBorder)` on TextField
* Use `.buttonStyle()` on Button (e.g., `.borderedProminent`)

#### 6. Structure Example

```
ContentView
 └─ VStack (main container)
     ├─ HStack (input section)
     │   ├─ TextField
     │   └─ Button("Add")
     └─ VStack or ForEach (tasks list)
         └─ ForEach(items)
             └─ HStack (each task row)
                 ├─ Image(systemName: "...")
                 └─ Text(task)
```

---

## 8. Resources

* Apple Docs: SwiftUI Essentials
* SwiftUI cheat sheets
* SwiftUI basics videos on YouTube
* [SF Symbols Browser](https://developer.apple.com/sf-symbols)

---

# Lesson 3 — Lists & Navigation

<a id="goal-of-the-lesson-3"></a>
## Goal of the lesson

By the end of this lesson, the student should be able to:

* Use `List` to display collections of data
* Implement navigation using `NavigationView` and `NavigationLink`
* Create detail views and pass data between screens
* Organize lists using `Section` with headers and footers
* Use `@Binding` to edit data in detail views
* Handle user interactions in lists (swipe-to-delete)
* Apply list modifiers for styling

---

## 1. Lists in SwiftUI

### Concept:

> `List` is a container that displays rows of data. It's optimized for scrolling and automatically handles cell reuse.

### Example:

```swift
struct ContentView: View {
    let items = ["Apple", "Banana", "Orange"]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text(item)
            }
        }
    }
}
```

---

## 2. Navigation

### Concept:

> `NavigationView` provides a navigation container, and `NavigationLink` creates tappable rows that navigate to detail views. You can pass data to detail views through their initializers.

### Key points:

* `NavigationView` wraps your content and provides navigation capabilities.
* `NavigationLink` creates tappable rows that navigate to another view.
* Pass data to detail views by including it as a parameter in the view's initializer.
* Use `.navigationTitle()` to set the title of the current screen.
* The detail view receives data as a `let` constant.

### Example:

```swift
struct ContentView: View {
    let fruits = ["Apple", "Banana", "Orange"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits, id: \.self) { fruit in
                    NavigationLink(destination: DetailView(fruit: fruit)) {
                        Text(fruit)
                    }
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

struct DetailView: View {
    let fruit: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(fruit)
                .font(.largeTitle)
            Text("You selected: \(fruit)")
                .foregroundColor(.secondary)
        }
        .navigationTitle(fruit)
        .padding()
    }
}
```

---

## 3. List Sections

### Concept:

> `Section` groups related rows in a list and can have headers and footers.

### Key points:

* Use `Section` to organize list items into groups.
* Add headers with `header:` parameter.
* Add footers with `footer:` parameter.

### Example:

```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fruits")) {
                    Text("Apple")
                    Text("Banana")
                    Text("Orange")
                }
                
                Section(header: Text("Vegetables")) {
                    Text("Carrot")
                    Text("Broccoli")
                }
            }
            .navigationTitle("Shopping List")
        }
    }
}
```

---

## 4. List Modifiers

### Key points:

* Lists can be styled with various modifiers.
* `.listStyle()` changes the appearance.
* `.onDelete()` enables swipe-to-delete.

### Example:

```swift
struct ContentView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("My List")
            .listStyle(.insetGrouped)
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
```

---

## 5. Binding in Navigation

### Concept:

> `@Binding` allows a child view to modify data owned by a parent view. Use it when you need to edit data in a detail view.

### Key points:

* `@Binding` creates a two-way connection between views.
* Parent view uses `@State`, child view uses `@Binding`.
* Pass binding with `$` prefix: `$variableName`.

### Example:

```swift
struct ContentView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items.indices, id: \.self) { index in
                    NavigationLink(destination: EditView(item: $items[index])) {
                        Text(items[index])
                    }
                }
            }
            .navigationTitle("My List")
        }
    }
}

struct EditView: View {
    @Binding var item: String
    
    var body: some View {
        VStack {
            TextField("Edit item", text: $item)
                .textFieldStyle(.roundedBorder)
                .padding()
            Text("Current value: \(item)")
        }
        .navigationTitle("Edit")
    }
}
```

---

## 6. Homework — Shopping List App

Create a simple SwiftUI app with:

### Requirements:

1. Use: `NavigationView`, `List`, `Section`, `ForEach`, `NavigationLink`, `@State`, `@Binding`, `TextField`, `Button`
2. Features:

   * TextField for item input
   * "Add" button to add items to the list
   * Store items in `@State var items = [String]()`
   * Display items in a `List` organized with `Section`:
     * Use at least one `Section` with a header (e.g., "My Items" or "Shopping List")
     * Items should be inside the section
   * Use `ForEach` to iterate over items
   * Each item should be a `NavigationLink` to a detail/edit view
   * Detail/Edit view:
     * Use `@Binding` to allow editing the item name
     * Shows a `TextField` bound to the item (using `@Binding`)
     * Displays the current item value
     * Changes made in detail view should update the main list automatically
     * Has a navigation title (e.g., "Edit Item")
   * Swipe-to-delete functionality (use `.onDelete()` modifier on `ForEach`)
   * Navigation title "Shopping List" on the main list screen
   * Clean layout with proper spacing and padding

---

## 7. Resources

* Apple Docs: Lists and Navigation
* SwiftUI List tutorial
* NavigationView documentation
