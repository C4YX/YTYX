#import <UIKit/UIKit.h>
// حجب جميع الاعلانات &  Block all ads
%hook YTAdsInnerTubeContextDecorator
- (void)decorateContext:(id)arg1 {
	arg1 = NULL;
	%orig;
}
%end
//   التبديل ببين الفيديو والصوت في يوتيوب ميوزك فقط ـ & Enable switching between audio and video only in YouTube Music
%hook YTMAudioVideoModeController
- (void)setSwitchAvailability:(long long)arg1 {
	arg1 = 1;
	%orig;
}
%end
// اضافة نص بالاعدادات في الميوزك فقط  & Add text within YouTube Music profile only
%hook YTMAvatarAccountView
- (void)setMemberStatusText:(id)arg1 {
	arg1 = @"YX";
	%orig;
}
%end
// تفعيل بعض مميزات البريميم & Activate some Premium
%hook YTMMusicAppMetadata
- (bool)isPremiumSubscriber {
	return YES;
}

- (bool)isMATScreenedCastEnabled {
	return YES;
}

- (bool)isSearchButtonHidden {
	return NO;
}
%end

%hook YTIPlayabilityStatus
// التشغيل في الخلفيه & Enable background play
- (bool)isPlayableInBackground {
	return YES;
}
// خاصية  PiP في اليوتيوب فقط & Enable or disable PIP in YouTube only
- (bool)isPlayableInPictureInPicture {
	return YES;
}
%end

// اخفاء اعلان البريميم بالاعدادت & Hide the premium ad in your YouTube Music profile only
%hook YTMNavigationDrawerPromoView
- (void)loadModel:(id)arg1 {
	arg1 = NULL;
	%orig;
}
%end
// اخفاء التعليمات او التلميحات & Hide hints
%hook YTMSettings
- (bool)areHintsDisabled {
	return YES;
}
%end
