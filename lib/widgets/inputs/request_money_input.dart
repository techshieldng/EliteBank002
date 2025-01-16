import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/language/language_controller.dart';
import 'package:qrpay/utils/size.dart';

import '../../backend/model/wallets/wallets_model.dart';
import '../../controller/categories/request_money/request_money_controller.dart';
import '../../language/english.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../text_labels/title_heading4_widget.dart';
import 'input_formater.dart';

class RequestMoneyInputWithDropdown extends StatefulWidget {
  final String hint, icon, label;
  final int maxLines;
  final bool isValidator;
  final EdgeInsetsGeometry? paddings;
  final TextEditingController controller;

  const RequestMoneyInputWithDropdown({
    super.key,
    required this.controller,
    required this.hint,
    this.icon = "",
    this.isValidator = true,
    this.maxLines = 1,
    this.paddings,
    required this.label,
  });

  @override
  State<RequestMoneyInputWithDropdown> createState() =>
      _PrimaryInputWidgetState();
}

class _PrimaryInputWidgetState extends State<RequestMoneyInputWithDropdown> {
  FocusNode? focusNode;
  final currencyController = Get.put(RequestMoneyController());

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  final languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.of(context).size.shortestSide >= 600;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHeading4Widget(
          text: widget.label,
          fontWeight: FontWeight.w600,
        ),
        verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
        Row(
          children: [
            Expanded(
              flex: 9,
              child: TextFormField(
                validator: widget.isValidator == false
                    ? null
                    : (String? value) {
                        if (value!.isEmpty) {
                          return Strings.pleaseFillOutTheField;
                        } else {
                          return null;
                        }
                      },
                textInputAction: TextInputAction.done,
                controller: widget.controller,
                onTap: () {
                  setState(() {
                    focusNode!.requestFocus();
                  });
                },
                onChanged: (v) {
                  if (currencyController.amountController.text.isEmpty) {
                    currencyController.amountController.text = "";
                  } else {
                    currencyController.remainingController.senderAmount.value =
                        currencyController.amountController.text;
                    currencyController.remainingController
                        .getRemainingBalanceProcess();
                  }
                  currencyController.getFee(
                    rate: currencyController.rate.value,
                  );
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    focusNode!.unfocus();
                  });
                },

             cursorColor: CustomColor.primaryLightColor,

                focusNode: focusNode,
                textAlign: TextAlign.left,
                style: Get.isDarkMode
                    ? CustomStyle.darkHeading3TextStyle
                    : CustomStyle.lightHeading3TextStyle,
                inputFormatters: <TextInputFormatter>[
                  DecimalTextInputFormatter()
                ],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                maxLines: widget.maxLines,
                decoration: InputDecoration(
                  hintText: languageController.getTranslation(widget.hint),
                  hintStyle: GoogleFonts.inter(
                    fontSize: Dimensions.headingTextSize3,
                    fontWeight: FontWeight.w500,
                    color: Get.isDarkMode
                        ? CustomColor.primaryDarkTextColor.withValues(alpha:0.2)
                        : CustomColor.primaryTextColor.withValues(alpha:0.2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.5),
                    borderSide: BorderSide(
                      color: CustomColor.primaryLightColor.withValues(alpha:0.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.5),
                    borderSide: BorderSide(
                        width: 2, color: CustomColor.primaryLightColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.5),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.5),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.widthSize * 1.7,
                    vertical: Dimensions.heightSize,
                  ),
                  suffixIcon: Obx(
                    () => Container(
                      height: Dimensions.inputBoxHeight * 0.85,
                      padding:
                          EdgeInsets.only(left: Dimensions.widthSize * 0.5),
                      alignment: Alignment.centerRight,
                      width: isTablet()
                          ? Dimensions.widthSize * 6
                          : Dimensions.widthSize * 7.5,
                      decoration: BoxDecoration(
                          color: CustomColor.primaryLightColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius * 0.5),
                            bottomRight:
                                Radius.circular(Dimensions.radius * 0.5),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: DropdownButton<MainUserWallet>(
                          iconEnabledColor: CustomColor.whiteColor,
                          iconSize: Dimensions.heightSize * 1.5,
                          dropdownColor: CustomColor.primaryLightColor,
                          underline: Container(),
                          hint: Text(
                            currencyController
                                .selectMainWallet.value!.currency.code,
                            style: GoogleFonts.inter(
                              color: CustomColor.whiteColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          menuMaxHeight:
                              MediaQuery.sizeOf(context).height * 0.5,
                          items: currencyController.walletsList
                              .map<DropdownMenuItem<MainUserWallet>>(
                            (value) {
                              return DropdownMenuItem<MainUserWallet>(
                                value: value,
                                child: Text(
                                  value.currency.code,
                                  style: GoogleFonts.inter(
                                    color: CustomColor.whiteColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (MainUserWallet? value) {
                            currencyController.selectMainWallet.value = value!;
                            currencyController.remainingController
                                .senderCurrency.value = value.currency.code;
                            currencyController.remainingController
                                .getRemainingBalanceProcess();
                            // currencyController.rate.value = currencyController
                            //         .requestMoneyInfoModel.data.baseCurrRate *
                            //     value.currency.rate;
                            // currencyController.limitMin.value =
                            //     currencyController.requestMoneyInfoModel.data
                            //             .requestMoneyCharge.minLimit *
                            //         currencyController.rate.value;
                            // currencyController.limitMax.value =
                            //     currencyController.requestMoneyInfoModel.data
                            //             .requestMoneyCharge.maxLimit *
                            //         currencyController.rate.value;

                            currencyController.getFee(
                              rate: currencyController.rate.value,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
