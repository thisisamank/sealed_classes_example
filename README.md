This Github repository contains the source code for the blog post titled "Using Sealed Classes in Dart". In this blog post, we explore the benefits of sealed classes in Dart and provide some real-life examples of how to use them.

## Getting Started
To get started with this code, you will need to have Flutter installed on your machine. Once Flutter is installed, you can clone this repository and open it in your favorite code editor.
You will have to switch to flutter beta channel to run the code. To do so, run the following command in your terminal:
```bash
flutter channel beta
```
Then, run the following command to upgrade your Flutter installation:
```bash
flutter upgrade
```


## Code Overview
The code in this repository is organized into several files, each serving a different purpose. Here is a brief overview of the different files:

`endpoints.dart`: This file contains the API endpoint URL for the Todo app.
`either.dart`: This file contains the implementation of the Either class, which is used to handle error cases.
`todo_repository.dart`: This file contains the TodoRepository class, which fetches data from the API and returns it as an Either type.
`future_value.dart`: This file contains the FutureValue class, which is used to safely manipulate asynchronous data.
`todo_notifier.dart`: This file contains the TodoNotifier class, which manages the state of the API request.
`todo_screen.dart`: This file contains the TodoScreen class, which displays the list of Todo items.

## Conclusion
We hope that you find this code and blog post helpful in understanding sealed classes in Dart. If you have any questions or comments, please feel free to open an issue on this repository. Thank you for reading!