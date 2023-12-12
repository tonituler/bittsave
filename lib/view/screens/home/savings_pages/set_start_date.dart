import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bittsave/app/extensions.dart';
import 'package:bittsave/util/color_resources.dart';
import 'package:bittsave/view/screens/home/savings_pages/choos_payment_source.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../funding_options/request_from_a_riend/friend_identity.dart';
import '../funding_usd_wallet_page.dart';
import 'myPlans.dart';

class SetStartDate extends StatefulWidget {
  SetStartDate({Key key, @required this.savingsInfo}) : super(key: key);
  Map<String, dynamic> savingsInfo;

  @override
  State<SetStartDate> createState() => _SetStartDateState();
}

class _SetStartDateState extends State<SetStartDate> {
  TextEditingController date = TextEditingController();
  String _selectedDate;

  @override
  void initState() {
    super.initState();

    _selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
    date.text = _selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackGroundColr(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              BackButtons(),
              Text('Set a Start date', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22)),
              SizedBox(height: 8),
              Text('When would like to start saving this amount?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15)),
              SizedBox(height: 100),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: false,
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.h),
                        topRight: Radius.circular(20.h),
                      ),
                    ),
                    builder: (context) {
                      return StatefulBuilder(builder: (context, updateState) {
                        return Container(
                          height: 360,
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: ColorResources.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.h),
                                    topRight: Radius.circular(20.h),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.white, fontSize: 18.sp),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          date.text = _selectedDate;
                                          updateState(() {});
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Done',
                                          style: TextStyle(color: Colors.white, fontSize: 18.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: SfDateRangePicker(
                                  showNavigationArrow: true,
                                  minDate: DateTime.now(),
                                  onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                                    _selectedDate = DateFormat('yyyy-MM-dd').format(args.value).toString();
                                    updateState(() {});
                                    setState(() {});
                                  },
                                  selectionMode: DateRangePickerSelectionMode.single,
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    },
                  );
                },
                child: TextField(
                  controller: date,
                  enabled: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: ColorResources.primaryColor,
                    ),
                    hintText: 'June 26, 2022',
                    // hintStyle: TextStyle(color: Colors.pink, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: newContTap(
                  col: Colors.pink,
                  text: 'Proceed to Payment',
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChoosePayMentSource(
                          savingsInfo: {
                            ...widget.savingsInfo,
                            "start_date": date.text,
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
