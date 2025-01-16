import '../../../utils/basic_screen_imports.dart';

extension PreviewRecipient on Widget {
  Widget previewRecipient({
    required recipient,
    required name,
    required subTitle,
    required nameRow,
    required subTitleRow,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? CustomColor.primaryBGDarkColor
            : CustomColor.primaryBGLightColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.marginSizeVertical * 0.7,
              bottom: Dimensions.marginSizeVertical * 0.3,
              left: Dimensions.paddingSize * 0.7,
              right: Dimensions.paddingSize * 0.7,
            ),
            child: CustomTitleHeadingWidget(
                text: recipient,
                textAlign: TextAlign.left,
                style: CustomStyle.f20w600pri),
          ),
          Divider(
            thickness: 1,
            color: CustomColor.primaryLightColor.withValues(alpha:0.2),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.marginSizeVertical * 0.3,
              bottom: Dimensions.marginSizeVertical * 0.6,
              left: Dimensions.paddingSize * 0.7,
              right: Dimensions.paddingSize * 0.7,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    TitleHeading3Widget(
                      text: name,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.primaryLightColor.withValues(alpha:0.6),
                    ),
                    TitleHeading3Widget(
                      text: nameRow,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.primaryLightColor.withValues(alpha:0.6),
                    ),
                  ],
                ),
                verticalSpace(Dimensions.heightSize * 0.4),
                Visibility(
                  visible: subTitle == null ? false : true,
                  child: Row(
                    mainAxisAlignment: mainSpaceBet,
                    children: [
                      TitleHeading4Widget(
                        text: subTitle,
                        fontWeight: FontWeight.w400,
                        color: CustomColor.primaryLightColor.withValues(alpha:0.4),
                      ),
                      TitleHeading4Widget(
                        text: subTitleRow,
                        fontWeight: FontWeight.w400,
                        color: CustomColor.primaryLightColor.withValues(alpha:0.4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
