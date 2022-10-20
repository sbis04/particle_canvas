import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  double? effectDurationSliderValue;
  double? particleGroupRadiusSliderValue;
  double? particleMaxSizeSliderValue;
  double? numberOfParticlesSliderValue;
  double? gapBetweenDrawFractionSliderValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      endDrawer: Drawer(
        elevation: 16,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFF2F2F2F),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Particle Group Radius',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFD4D4D4),
                          ),
                    ),
                  ),
                  Slider(
                    activeColor: Color(0xFFA3A3A3),
                    inactiveColor: Color(0xFF555555),
                    min: 10,
                    max: 50,
                    value: particleGroupRadiusSliderValue ??= 30,
                    label: particleGroupRadiusSliderValue.toString(),
                    divisions: 40,
                    onChanged: (newValue) {
                      setState(() => particleGroupRadiusSliderValue = newValue);
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Particle Max Size',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFD4D4D4),
                          ),
                    ),
                  ),
                  Slider(
                    activeColor: Color(0xFFA3A3A3),
                    inactiveColor: Color(0xFF555555),
                    min: 1,
                    max: 10,
                    value: particleMaxSizeSliderValue ??= 6,
                    label: particleMaxSizeSliderValue.toString(),
                    divisions: 9,
                    onChanged: (newValue) {
                      setState(() => particleMaxSizeSliderValue = newValue);
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Effect Duration',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFD4D4D4),
                          ),
                    ),
                  ),
                  Slider(
                    activeColor: Color(0xFFA3A3A3),
                    inactiveColor: Color(0xFF555555),
                    min: 1,
                    max: 10,
                    value: effectDurationSliderValue ??= 5,
                    label: effectDurationSliderValue.toString(),
                    divisions: 9,
                    onChanged: (newValue) {
                      setState(() => effectDurationSliderValue = newValue);
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Number of Particles',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFD4D4D4),
                          ),
                    ),
                  ),
                  Slider(
                    activeColor: Color(0xFFA3A3A3),
                    inactiveColor: Color(0xFF555555),
                    min: 5,
                    max: 20,
                    value: numberOfParticlesSliderValue ??= 12,
                    label: numberOfParticlesSliderValue.toString(),
                    divisions: 15,
                    onChanged: (newValue) {
                      setState(() => numberOfParticlesSliderValue = newValue);
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Gap Between Draw Fraction',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFD4D4D4),
                          ),
                    ),
                  ),
                  Slider(
                    activeColor: Color(0xFFA3A3A3),
                    inactiveColor: Color(0xFF555555),
                    min: 0,
                    max: 1,
                    value: gapBetweenDrawFractionSliderValue ??= 0.5,
                    label: gapBetweenDrawFractionSliderValue.toString(),
                    divisions: 10,
                    onChanged: (newValue) {
                      setState(
                          () => gapBetweenDrawFractionSliderValue = newValue);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          alignment: AlignmentDirectional(0.8999999999999999, -0.9),
          children: [
            custom_widgets.ParticleCanvas(
              width: double.infinity,
              height: double.infinity,
              particleGroupRadius: valueOrDefault<double>(
                particleGroupRadiusSliderValue,
                30.0,
              ),
              particleMaxSize: valueOrDefault<double>(
                particleMaxSizeSliderValue,
                6.0,
              ),
              effectDuration: valueOrDefault<double>(
                effectDurationSliderValue,
                5.0,
              ),
              numberOfParticles: valueOrDefault<int>(
                functions.convertDoubleToInt(valueOrDefault<double>(
                  numberOfParticlesSliderValue,
                  12.0,
                )),
                12,
              ),
              gapBetweenDrawFraction: valueOrDefault<double>(
                gapBetweenDrawFractionSliderValue,
                0.5,
              ),
              particleColor: colorFromCssString(
                FFAppState().selectedColor,
                defaultColor: FlutterFlowTheme.of(context).secondaryColor,
              ),
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 50,
              fillColor: Color(0xFF393939),
              icon: Icon(
                Icons.menu_rounded,
                color: Color(0xFFD0D0D0),
                size: 26,
              ),
              onPressed: () async {
                scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.9),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      child: InkWell(
                        onTap: () async {
                          setState(
                              () => FFAppState().selectedColor = '#39D2C0');
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      child: InkWell(
                        onTap: () async {
                          setState(
                              () => FFAppState().selectedColor = '#FF8B4C');
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF8B4C),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      child: InkWell(
                        onTap: () async {
                          setState(
                              () => FFAppState().selectedColor = '#5D45FF');
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Color(0xFF5D45FF),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      child: InkWell(
                        onTap: () async {
                          setState(
                              () => FFAppState().selectedColor = '#45FF6A');
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Color(0xFF45FF6A),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() => FFAppState().selectedColor = '#DC45FF');
                      },
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFFDC45FF),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
