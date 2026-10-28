ARCHS := arm64
TARGET := iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = Polonium

Polonium_FILES = main.m \
                 AppDelegate.m \
                 InjectorViewController.m \
                 MCMInjector.m \
                 HttpStateServer.m \
                 LoginOverlayView.m \
                 SecureHTTP.m \
                 ObfSec.m

Polonium_FRAMEWORKS = UIKit Foundation Security
Polonium_PRIVATE_FRAMEWORKS = IOKit
Polonium_CFLAGS = -fobjc-arc -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/application.mk

before-package::
	@echo "Removendo _CodeSignature para permitir re-assinatura posterior..."
	@rm -rf $(THEOS_STAGING_DIR)/Applications/Polonium.app/_CodeSignature
