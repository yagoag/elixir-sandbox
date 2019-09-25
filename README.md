# Yago's Elixir sandbox

### Create a project

`mix new project_name`

If you want your project to have its supervison generated, you can add the `--sup` parameter at the end

### Start project

Since we have created our project with mix, we can use its script to compile and run the whole project:

`iex -S mix`

### Observer

If you want to look at how the processes are organized, you can run (inside of the `iex`):

`:observer.start()`
