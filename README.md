# glitch

### Installing Ruby on OSX
Don't use system ruby on OSX because it's hooked into everything.

Ruby 3.0.0 does not work with newer versions of mySQL, use 2.7.0
```
\curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm install 2.7.0
```

## Backend Installation
```
gem install bundler
brew install imagemagick
bundle install
```

## Frontend Installation
```
cd /app
npm i
```

## Running from Command Line
A simple command line runner is available to create either a single or 100 glitched images.
A random image will be selected from /input and the resulting glitch will be put in /output

```
./runner.rb
```

## Running the API
```
ruby server/app.rb
```


## Gallery
![](sample_images/annual-hat-man.png)
![](sample_images/fattish-business_map.png)
![](sample_images/interested-Tiger-jumping-transparent-png-image.png)
![](sample_images/killable-star-maker.png)
![](sample_images/leonine-business_map.png)
![](sample_images/meretricious-mouth-of-the-dragon.png)
![](sample_images/neck-veils.png)
