# ParticlesCanvas

Particle dissipating effect created using [Flutter](https://flutter.dev/), [FlutterFlow](https://flutterflow.io/), and some math!

> Try out the [**DEMO**](https://app.flutterflow.io/run/4JpKoK5qLbS3TuZpU0Fn)! *(But it's recommended to run it as a desktop or mobile app as it's not that optimized, so on web might be a little jarring)*
> 
> **FlutterFlow project:** https://app.flutterflow.io/project/particles-demo-vd2vhs

https://user-images.githubusercontent.com/43280874/196859599-aa01e922-86fc-47fe-957c-79d667006764.mov

The `ParticleCanvas` is a FlutterFlow [Custom Widget](https://docs.flutterflow.io/customizing-your-app/custom-widgets), the color selector and the property editor are all built inside FlutterFlow.

## ParticleCanvas

This holds the logic for accepting user input for drawing on the canvas and particle dissipation effect. It accepts the following properties that you can customize:

``` dart
class ParticleCanvas extends StatefulWidget {
  const ParticleCanvas({
    Key? key,
    this.width,
    this.height,
    this.particleGroupRadius = 30.0,
    this.particleMaxSize = 6.0,
    this.effectDuration = 5.0,
    this.numberOfParticles = 12,
    this.gapBetweenDrawFraction = 0.5,
    this.particleColor = Colors.tealAccent,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double particleGroupRadius;
  final double particleMaxSize;
  final double effectDuration;
  final int numberOfParticles;
  final double gapBetweenDrawFraction;
  final Color particleColor;

  @override
  State<ParticleCanvas> createState() => _ParticleCanvasState();
}
```

## License

Copyright (c) 2022 Souvik Biswas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
