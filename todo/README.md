# todo

A Todo Flutter Applicatioin.

## ChangeNotifierProvider and ChangeNotifierProxyProvider

This project is a project to show the usage of provider package to handle state in flutter application.
we first use the couple ChangeNotifierProvider & ChangeNotifierProxyProvider. Doing this we create:

- TodoListState and TodoListProvider
- TodoFilter and TodoFilterProvider
- SearchTodoState and SearchTodoProvider
- ActiveTodoCountState and ActiveTodoCountProvider
- FilteredTodoState and FilteredTodoProvider

The concept here is to create a state, a create a provider to update the state.

after create a state a provider, we then inject it in our application root widget tree using:
- Multyprovider widget
- ChangeNotifierProvider
- ChangeNotifierProxyProvider

As our state are present in the application root widget tree, we can access the using:
- context.watch went we need the widget to reload when the value change
- context.listen
- context.read 

