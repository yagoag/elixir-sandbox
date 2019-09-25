# Yago's Elixir sandbox

### Create a project

`mix new project_name`

If you want your project to have its supervison generated, you can add the `--sup` parameter at the end

### Start project

Since we have created our project with mix, we can use its script to compile and run the whole project:

`iex -S mix`

or

`mix run`

(if you want to hold the console, add `--no-halt`)

### Observer

If you want to look at how the processes are organized, you can run (inside of the `iex`):

`:observer.start()`

### Installing dependencies

To install dependencies after adding them to your mix.exs file, run:

`mix do deps.get`

you can add `, compile` to the end if you want to compile it already as well
