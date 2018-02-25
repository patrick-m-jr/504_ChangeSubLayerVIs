# 504_ChangeSubLayerVIs
Simple Tutorial For Modifying Sample Code for AppStudio App. In this tuturial, I'll configure Changing SubLayer Visibility (Turning Layers in a Map Service On and Off)

## Select New App Button and Find the Change Sublayer Visibility app 

Begin by starting a New App on AppStudio for Desktop, Navigate to and Create the "Change Sublayer Visibility", and Finally let's edit this in QT!

## Updating Three Sections of the QT Code: Map Background, URL for MapServer, and Viewpoint parameters. These are indicated by the red arrows. 

### 1. Basemap options: Update the basemap accordingly. A <a href = "https://developers.arcgis.com/qt/latest/qml/api-reference/qml-esri-arcgisruntime-basemap.html" target = "_blank"> list </a> of options can be found here. 

```
BasemapTopographic
BasemapDarkGrayCanvasVector
etc.
```

### 2. Updating "ArcGISMapImageLayer" Object

This is a simple update. It requires a "Map Service URL" that is accessible (without secure access) and shared publicly. I attempted to call both Tile Layers as well as 

A step by step series of examples that tell you have to get a development env running


```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc
