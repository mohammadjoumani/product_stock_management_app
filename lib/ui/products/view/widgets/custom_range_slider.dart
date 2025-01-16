import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    required this.onRangeChanged,
  });

  final num minPrice;
  final num maxPrice;
  final Function(RangeValues) onRangeChanged;

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  late RangeValues _rangeValues;

  @override
  void initState() {
    super.initState();
    _rangeValues = RangeValues(
      widget.minPrice.toDouble(),
      widget.maxPrice.toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _rangeValues,
      min: 1,
      max: 10000,
      divisions: 10000,
      labels: RangeLabels(
        _rangeValues.start.round().toString(),
        _rangeValues.end.round().toString(),
      ),
      onChanged: (values) {
        setState(() {
          _rangeValues = values;
          widget.onRangeChanged(values); // Notify parent about changes
        });
      },
      activeColor: colorPrimary,
      inactiveColor: colorDisable,
    );
  }
}
