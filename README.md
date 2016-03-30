# Budget
This is my first ruby project. It is a project that allows you to analayze a bunch of bank account entries in different ways, and view the results.

## Motivation
I wanted to play with the concept of a main processor of data, and of multiple clients of different nature integrating with it. The processor is the Master, that expects input in a certain way, and delivers output in a standardized way too. This way, multiple clients can obey its interface and hook up to it. The processor in this case is a server, and the clients are a webpage and a console tool. These 2 clients get input in any way they can (according to their nature), format this input to the way the Master expects, get the output, and format it in the way that makes sence acording to their nature. For example, the Console client displays entries in a table, while the Web client generates graphs.

One can imagine many other forms of cleints, for example a File client, that is a directory watcher: Takes user input by the contents of new files, and outputs the Master's result in files in this directory.

## Getting Started
If you want to download it and see how it works,  you can simply clone the repository and install the dependencies. This is how to do it:

Bundler is a gem that helps manage dependencies. Install it
```
gem install bundler
```

And let it install all the projects dependencies, specified in the Gemfile, and Gemfile.lock
```
gem install bundler
```

### Run the Application

The simplest way to start the project is to navigate to the project root and type
```
ruby runMain.rb
```

### Play with the clients
Now browse to the app at `http://localhost:3000/page.html`.

If you want to check the Console client too, do
```
ruby runConsole.rb
```


