# Yago's Elixir sandbox

## Elixir

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

### Generate docs

You can use ExDoc to generate your documentation pages ([Elixir school page](https://elixirschool.com/en/lessons/basics/documentation/#exdoc))

## Phoenix

### Create a project

`mix phx.new project_name`

### Run project

`mix phoenix.run`

(or `iex -S mix phoenix.run` if you want to run it inside of iex)

### Generate models and JSON boilerplate

`mix phx.gen.json ContextName ModelName modelNames [field1:type[, field2:type[, ...]]]`

First parameter should be the context name, then the model name (singular and capitalized, then plural starting with lowercase). Parameters can be defined in this command or added manually later on the generated files.

### Create database from models

`mix ecto.create`

### Create/update tables

`mix ecto.migrate`

### Expose API on router

If we want to expose an API, instead of writing every single method by hand, we can use the `resources` function to generate the CRUD for that API, like that:

`resources "/path", MyController[, only: [:index, :show]]`

The last part makes only certain actions available on the API, rather than the whole CRUD (default behavior). You can change which actions to leave available

### Seeds

Seed files will be used to create database entries (used for development & testing, for instance). To run these files and add the entries to the database use

`mix run path/to/seeds.exs`

### ja-serializer

If you are creating an API, you might want to follow the JSONAPI.org specs. If that is the case it might be helpful to use [ja-serializer](https://github.com/vt-elixir/ja_serializer) to help lower the amount of code you have to write.

## Useful links

- [Elixir School Website](https://elixirschool.com/)
- [Official Phoenix Website](https://hexdocs.pm/phoenix/overview.html)
- [Elixir tutorials (by Tensor Programming)](https://www.youtube.com/playlist?list=PLJbE2Yu2zumAgKjSPyFtvYjP5LqgzafQq)
- [Build a JSON API with Elixir/Phoenix in under an hour (by Scott Batson)](https://www.youtube.com/watch?v=X9AggnaEXrM)
- [Phoenix: Creating Basic Web App (Pluralsight Course)](https://www.pluralsight.com/interactive-courses/phoenix-creating-basic-web-app)
