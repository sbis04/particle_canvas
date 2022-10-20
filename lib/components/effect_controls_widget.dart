import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EffectControlsWidget extends StatefulWidget {
  const EffectControlsWidget({Key? key}) : super(key: key);

  @override
  _EffectControlsWidgetState createState() => _EffectControlsWidgetState();
}

class _EffectControlsWidgetState extends State<EffectControlsWidget> {
  double? sliderValue1;
  double? sliderValue2;
  double? sliderValue3;
  double? sliderValue4;
  double? sliderValue5;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2F2F2F),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
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
              value: sliderValue1 ??= 30,
              divisions: 40,
              onChanged: (newValue) {
                setState(() => sliderValue1 = newValue);
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
              value: sliderValue2 ??= 6,
              divisions: 9,
              onChanged: (newValue) {
                setState(() => sliderValue2 = newValue);
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
              value: sliderValue3 ??= 5,
              divisions: 9,
              onChanged: (newValue) {
                setState(() => sliderValue3 = newValue);
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
              value: sliderValue4 ??= 12,
              divisions: 15,
              onChanged: (newValue) {
                setState(() => sliderValue4 = newValue);
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
              value: sliderValue5 ??= 0.5,
              divisions: 10,
              onChanged: (newValue) {
                setState(() => sliderValue5 = newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
