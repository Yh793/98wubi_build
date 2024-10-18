; 使用时需将字体文件和图标文件放置在脚本同一目录下
; 字体下载 98五笔资源库 http://98wb.ys168.com

!include x64.nsh
!include WinMessages.nsh

VIProductVersion "1.0.0.0"
VIAddVersionKey /LANG=2052 "ProductName" "98五笔字体支持"
VIAddVersionKey /LANG=2052 "Comments" "十万超集-注册表支持"
VIAddVersionKey /LANG=2052 "CompanyName" "五笔小筑"
VIAddVersionKey /LANG=2052 "LegalCopyright" "98五笔资源库"
VIAddVersionKey /LANG=2052 "FileDescription" "十万超集-字体支持"
VIAddVersionKey /LANG=2052 "FileVersion" "1.0.0.0"

; The name of the installer
Name "98五笔字体支持"
BrandingText "Powered by 五笔小筑"

LoadLanguageFile "${NSISDIR}\Contrib\Language files\SimpChinese.nlf"

OutFile "98五笔字体支持.exe"

Icon "wubi.ico"

; Request application privileges for Windows Vista
RequestExecutionLevel admin

SetCompressor /SOLID lzma
ShowInstDetails show

; 先清理字体
Section "Clean Fonts"

  System::Call "GDI32::RemoveFontResource(t) i ('98WB-0.otf') .s"
  System::Call "GDI32::RemoveFontResource(t) i ('98WB-1.otf') .s"
  System::Call "GDI32::RemoveFontResource(t) i ('98WB-2.otf') .s"
  System::Call "GDI32::RemoveFontResource(t) i ('98WB-3.otf') .s"
  System::Call "GDI32::RemoveFontResource(t) i ('98WB-U.otf') .s"
  System::Call "GDI32::RemoveFontResource(t) i ('98WB-V.otf') .s"
  
  ; Remove registry keys
  DeleteRegValue HKCU "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-0 (TrueType)"
  DeleteRegValue HKCU "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-1 (TrueType)"
  DeleteRegValue HKCU "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-2 (TrueType)"
  DeleteRegValue HKCU "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-3 (TrueType)"
  DeleteRegValue HKCU "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-U (TrueType)"
  DeleteRegValue HKCU "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-V (TrueType)"
  
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-0 (TrueType)"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-1 (TrueType)"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-2 (TrueType)"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-3 (TrueType)"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-U (TrueType)"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-V (TrueType)"
  
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack" "SURROGATE"
  DeleteRegValue HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack" "SURROGATE"
  
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback" "Plane1"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback" "Plane2"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback" "Plane3"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback" "Plane15"
  
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane1"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane2"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane3"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane15"
  
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane1"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane2"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane3"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane15"
  
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink" "98WB-0"
  DeleteRegValue HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink" "98WB-3"
  DeleteRegValue HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink" "98WB-U"
  DeleteRegValue HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink" "98WB-V"
  
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-U"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-V"
  DeleteRegKey HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-U"
  DeleteRegKey HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-V"
  
  Delete /REBOOTOK "$LOCALAPPDATA\Microsoft\Windows\Fonts\98WB-*.otf"
  Delete /REBOOTOK "$FONTS\98WB-*.otf"
  
  SendMessage ${HWND_BROADCAST} ${WM_FONTCHANGE} 0 0 /TIMEOUT=5000
  
  Call CheckRebootAndProceed
  
SectionEnd

;安装字体
Section "Install Fonts"

  SetOutPath "$FONTS"
  File "98WB-0.otf"
  File "98WB-1.otf"
  File "98WB-2.otf"
  File "98WB-3.otf"
  File "98WB-U.otf"
  File "98WB-V.otf"
  
  System::Call "GDI32::AddFontResource(t) i ('98WB-0.otf') .s"
  System::Call "GDI32::AddFontResource(t) i ('98WB-1.otf') .s"
  System::Call "GDI32::AddFontResource(t) i ('98WB-2.otf') .s"
  System::Call "GDI32::AddFontResource(t) i ('98WB-3.otf') .s"
  System::Call "GDI32::AddFontResource(t) i ('98WB-U.otf') .s"
  System::Call "GDI32::AddFontResource(t) i ('98WB-V.otf') .s"
  
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-0 (TrueType)" "98WB-0.otf"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-1 (TrueType)" "98WB-1.otf"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-2 (TrueType)" "98WB-2.otf"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-3 (TrueType)" "98WB-3.otf"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-U (TrueType)" "98WB-U.otf"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" "98WB-V (TrueType)" "98WB-V.otf"
  
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack" "SURROGATE" "dword:00000002"
  WriteRegStr HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack" "SURROGATE" "dword:00000002"
  
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback" "Plane1" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback" "Plane2" "98WB-U"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback" "Plane3" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback" "Plane15" "98WB-V"
  
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-U" "Plane1" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-U" "Plane2" "98WB-U"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-U" "Plane3" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-U" "Plane15" "98WB-V"
  
  WriteRegStr HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-U" "Plane1" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-U" "Plane2" "98WB-U"
  WriteRegStr HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-U" "Plane3" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-U" "Plane15" "98WB-V"
  
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-V" "Plane1" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-V" "Plane2" "98WB-U"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-V" "Plane3" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-V" "Plane15" "98WB-V"
  
  WriteRegStr HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-V" "Plane1" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-V" "Plane2" "98WB-U"
  WriteRegStr HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-V" "Plane3" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\98WB-V" "Plane15" "98WB-V"
  
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane1" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane2" "98WB-U"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane3" "98WB-V"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\LanguagePack\SurrogateFallback\SimSun" "Plane15" "98WB-V"
  
  WriteRegMultiStr /REGEDIT5 HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink" "98WB-U" 39,00,38,00,57,00,42,00,2d,00,56,00,2e,00,4f,00,54,00,46,00,2c,\
  00,39,00,38,00,57,00,42,00,2d,00,56,00,00,00,53,00,49,00,4d,00,53,00,55,00,\
  4e,00,2e,00,54,00,54,00,43,00,2c,00,53,00,69,00,6d,00,53,00,75,00,6e,00,00,\
  00,53,00,49,00,4d,00,53,00,55,00,4e,00,42,00,2e,00,54,00,54,00,46,00,2c,00,\
  53,00,69,00,6d,00,53,00,75,00,6e,00,2d,00,45,00,78,00,74,00,42,00,00,00,4d,\
  00,53,00,59,00,48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,69,00,63,00,72,00,\
  6f,00,73,00,6f,00,66,00,74,00,20,00,59,00,61,00,48,00,65,00,69,00,20,00,55,\
  00,49,00,2c,00,31,00,32,00,38,00,2c,00,39,00,36,00,00,00,4d,00,53,00,59,00,\
  48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,\
  00,66,00,74,00,20,00,59,00,61,00,48,00,65,00,69,00,20,00,55,00,49,00,00,00,\
  4d,00,53,00,59,00,48,00,2e,00,54,00,54,00,46,00,2c,00,31,00,32,00,38,00,2c,\
  00,39,00,36,00,00,00,4d,00,53,00,59,00,48,00,2e,00,54,00,54,00,46,00,00,00,\
  53,00,45,00,47,00,55,00,49,00,53,00,59,00,4d,00,2e,00,54,00,54,00,46,00,2c,\
  00,53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,20,00,53,00,79,00,6d,00,\
  62,00,6f,00,6c,00,00,00,53,00,45,00,47,00,4f,00,45,00,55,00,49,00,2e,00,54,\
  00,54,00,46,00,2c,00,53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,2c,00,\
  31,00,32,00,30,00,2c,00,38,00,30,00,00,00,53,00,45,00,47,00,4f,00,45,00,55,\
  00,49,00,2e,00,54,00,54,00,46,00,2c,00,53,00,65,00,67,00,6f,00,65,00,20,00,\
  55,00,49,00,00,00,4d,00,53,00,4a,00,48,00,2e,00,54,00,54,00,43,00,2c,00,4d,\
  00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,00,74,00,20,00,4a,00,68,00,65,00,\
  6e,00,67,00,68,00,65,00,69,00,20,00,55,00,49,00,00,00,4d,00,45,00,49,00,52,\
  00,59,00,4f,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,65,00,69,00,72,00,79,00,\
  6f,00,20,00,55,00,49,00,00,00,4d,00,41,00,4c,00,47,00,55,00,4e,00,2e,00,54,\
  00,54,00,46,00,2c,00,4d,00,61,00,6c,00,67,00,75,00,6e,00,20,00,47,00,6f,00,\
  74,00,68,00,69,00,63,00,2c,00,31,00,32,00,38,00,2c,00,39,00,36,00,00,00,4d,\
  00,41,00,4c,00,47,00,55,00,4e,00,2e,00,54,00,54,00,46,00,2c,00,4d,00,61,00,\
  6c,00,67,00,75,00,6e,00,20,00,47,00,6f,00,74,00,68,00,69,00,63,00,00,00,59,\
  00,55,00,47,00,4f,00,54,00,48,00,4d,00,2e,00,54,00,54,00,43,00,2c,00,59,00,\
  75,00,20,00,47,00,6f,00,74,00,68,00,69,00,63,00,20,00,55,00,49,00,2c,00,31,\
  00,32,00,38,00,2c,00,39,00,36,00,00,00,59,00,55,00,47,00,4f,00,54,00,48,00,\
  4d,00,2e,00,54,00,54,00,43,00,2c,00,59,00,75,00,20,00,47,00,6f,00,74,00,68,\
  00,69,00,63,00,20,00,55,00,49,00,00,00,53,00,49,00,4d,00,53,00,55,00,4e,00,\
  2e,00,54,00,54,00,43,00,2c,00,53,00,69,00,6d,00,53,00,75,00,6e,00,00,00,4d,\
  00,53,00,4a,00,48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,69,00,63,00,72,00,\
  6f,00,73,00,6f,00,66,00,74,00,20,00,4a,00,68,00,65,00,6e,00,67,00,48,00,65,\
  00,69,00,2c,00,31,00,32,00,38,00,2c,00,39,00,36,00,00,00,4d,00,53,00,4a,00,\
  48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,\
  00,66,00,74,00,20,00,4a,00,68,00,65,00,6e,00,67,00,48,00,65,00,69,00,00,00,\
  4d,00,45,00,49,00,52,00,59,00,4f,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,65,\
  00,69,00,72,00,79,00,6f,00,2c,00,31,00,32,00,38,00,2c,00,38,00,35,00,00,00,\
  4d,00,45,00,49,00,52,00,59,00,4f,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,65,\
  00,69,00,72,00,79,00,6f,00,00,00,00,00
  
   WriteRegMultiStr /REGEDIT5 HKLM "SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink" "98WB-V" 39,00,38,00,57,00,42,00,2d,00,55,00,2e,00,4f,00,54,00,46,00,2c,\
  00,39,00,38,00,57,00,42,00,2d,00,55,00,00,00,53,00,49,00,4d,00,53,00,55,00,\
  4e,00,2e,00,54,00,54,00,43,00,2c,00,53,00,69,00,6d,00,53,00,75,00,6e,00,00,\
  00,53,00,49,00,4d,00,53,00,55,00,4e,00,42,00,2e,00,54,00,54,00,46,00,2c,00,\
  53,00,69,00,6d,00,53,00,75,00,6e,00,2d,00,45,00,78,00,74,00,42,00,00,00,4d,\
  00,53,00,59,00,48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,69,00,63,00,72,00,\
  6f,00,73,00,6f,00,66,00,74,00,20,00,59,00,61,00,48,00,65,00,69,00,20,00,55,\
  00,49,00,2c,00,31,00,32,00,38,00,2c,00,39,00,36,00,00,00,4d,00,53,00,59,00,\
  48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,\
  00,66,00,74,00,20,00,59,00,61,00,48,00,65,00,69,00,20,00,55,00,49,00,00,00,\
  4d,00,53,00,59,00,48,00,2e,00,54,00,54,00,46,00,2c,00,31,00,32,00,38,00,2c,\
  00,39,00,36,00,00,00,4d,00,53,00,59,00,48,00,2e,00,54,00,54,00,46,00,00,00,\
  53,00,45,00,47,00,55,00,49,00,53,00,59,00,4d,00,2e,00,54,00,54,00,46,00,2c,\
  00,53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,20,00,53,00,79,00,6d,00,\
  62,00,6f,00,6c,00,00,00,53,00,45,00,47,00,4f,00,45,00,55,00,49,00,2e,00,54,\
  00,54,00,46,00,2c,00,53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,2c,00,\
  31,00,32,00,30,00,2c,00,38,00,30,00,00,00,53,00,45,00,47,00,4f,00,45,00,55,\
  00,49,00,2e,00,54,00,54,00,46,00,2c,00,53,00,65,00,67,00,6f,00,65,00,20,00,\
  55,00,49,00,00,00,4d,00,53,00,4a,00,48,00,2e,00,54,00,54,00,43,00,2c,00,4d,\
  00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,00,74,00,20,00,4a,00,68,00,65,00,\
  6e,00,67,00,68,00,65,00,69,00,20,00,55,00,49,00,00,00,4d,00,45,00,49,00,52,\
  00,59,00,4f,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,65,00,69,00,72,00,79,00,\
  6f,00,20,00,55,00,49,00,00,00,4d,00,41,00,4c,00,47,00,55,00,4e,00,2e,00,54,\
  00,54,00,46,00,2c,00,4d,00,61,00,6c,00,67,00,75,00,6e,00,20,00,47,00,6f,00,\
  74,00,68,00,69,00,63,00,2c,00,31,00,32,00,38,00,2c,00,39,00,36,00,00,00,4d,\
  00,41,00,4c,00,47,00,55,00,4e,00,2e,00,54,00,54,00,46,00,2c,00,4d,00,61,00,\
  6c,00,67,00,75,00,6e,00,20,00,47,00,6f,00,74,00,68,00,69,00,63,00,00,00,59,\
  00,55,00,47,00,4f,00,54,00,48,00,4d,00,2e,00,54,00,54,00,43,00,2c,00,59,00,\
  75,00,20,00,47,00,6f,00,74,00,68,00,69,00,63,00,20,00,55,00,49,00,2c,00,31,\
  00,32,00,38,00,2c,00,39,00,36,00,00,00,59,00,55,00,47,00,4f,00,54,00,48,00,\
  4d,00,2e,00,54,00,54,00,43,00,2c,00,59,00,75,00,20,00,47,00,6f,00,74,00,68,\
  00,69,00,63,00,20,00,55,00,49,00,00,00,53,00,49,00,4d,00,53,00,55,00,4e,00,\
  2e,00,54,00,54,00,43,00,2c,00,53,00,69,00,6d,00,53,00,75,00,6e,00,00,00,4d,\
  00,53,00,4a,00,48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,69,00,63,00,72,00,\
  6f,00,73,00,6f,00,66,00,74,00,20,00,4a,00,68,00,65,00,6e,00,67,00,48,00,65,\
  00,69,00,2c,00,31,00,32,00,38,00,2c,00,39,00,36,00,00,00,4d,00,53,00,4a,00,\
  48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,\
  00,66,00,74,00,20,00,4a,00,68,00,65,00,6e,00,67,00,48,00,65,00,69,00,00,00,\
  4d,00,45,00,49,00,52,00,59,00,4f,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,65,\
  00,69,00,72,00,79,00,6f,00,2c,00,31,00,32,00,38,00,2c,00,38,00,35,00,00,00,\
  4d,00,45,00,49,00,52,00,59,00,4f,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,65,\
  00,69,00,72,00,79,00,6f,00,00,00,00,00
  
   WriteRegMultiStr /REGEDIT5 HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink" "98WB-0" 4d,00,53,00,59,00,48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,69,\
  00,63,00,72,00,6f,00,73,00,6f,00,66,00,74,00,20,00,59,00,61,00,48,00,65,00,\
  69,00,20,00,55,00,49,00,2c,00,31,00,32,00,38,00,2c,00,39,00,36,00,00,00,4d,\
  00,53,00,59,00,48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,69,00,63,00,72,00,\
  6f,00,73,00,6f,00,66,00,74,00,20,00,59,00,61,00,48,00,65,00,69,00,20,00,55,\
  00,49,00,00,00,4d,00,53,00,59,00,48,00,2e,00,54,00,54,00,46,00,2c,00,31,00,\
  32,00,38,00,2c,00,39,00,36,00,00,00,53,00,45,00,47,00,55,00,49,00,53,00,59,\
  00,4d,00,2e,00,54,00,54,00,46,00,2c,00,53,00,65,00,67,00,6f,00,65,00,20,00,\
  55,00,49,00,20,00,53,00,79,00,6d,00,62,00,6f,00,6c,00,00,00,53,00,45,00,47,\
  00,4f,00,45,00,55,00,49,00,2e,00,54,00,54,00,46,00,2c,00,53,00,65,00,67,00,\
  6f,00,65,00,20,00,55,00,49,00,2c,00,31,00,32,00,30,00,2c,00,38,00,30,00,00,\
  00,53,00,45,00,47,00,4f,00,45,00,55,00,49,00,2e,00,54,00,54,00,46,00,2c,00,\
  53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,00,00,00,00
  
  WriteRegMultiStr /REGEDIT5 HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink" "98WB-3" 53,00,49,00,4d,00,53,00,55,00,4e,00,2e,00,54,00,54,00,43,00,2c,\
  00,53,00,69,00,6d,00,53,00,75,00,6e,00,00,00,53,00,49,00,4d,00,53,00,55,00,\
  4e,00,42,00,2e,00,54,00,54,00,46,00,2c,00,53,00,69,00,6d,00,53,00,75,00,6e,\
  00,2d,00,45,00,78,00,74,00,42,00,00,00,4d,00,53,00,59,00,48,00,2e,00,54,00,\
  54,00,43,00,2c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,00,74,00,20,\
  00,59,00,61,00,48,00,65,00,69,00,20,00,55,00,49,00,2c,00,31,00,32,00,38,00,\
  2c,00,39,00,36,00,00,00,4d,00,53,00,59,00,48,00,2e,00,54,00,54,00,43,00,2c,\
  00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,00,74,00,20,00,59,00,61,00,\
  48,00,65,00,69,00,2c,00,31,00,32,00,38,00,2c,00,39,00,36,00,00,00,00,00

  SendMessage ${HWND_BROADCAST} ${WM_FONTCHANGE} 0 0 /TIMEOUT=5000

  Call InstallDone

SectionEnd

Function CheckRebootAndProceed
  ; 检查是否设置了重启标志
  IfRebootFlag 0 noRebootNeeded
    MessageBox MB_YESNO|MB_ICONQUESTION "清理操作需要重启计算机以完成更改。是否立即重启？" IDYES rebootNow IDNO rebootReminde
  noRebootNeeded:
    MessageBox MB_YESNO|MB_ICONQUESTION "字体清理完成，是否要继续安装98五笔字体支持？" IDNO cancelInst
    Return
  rebootNow:
    Reboot
  rebootReminde:
    MessageBox MB_OK "请重启完成字体清理之后重新安装！"
    Quit
  cancelInst:
    Quit
FunctionEnd

Function InstallDone
  ; 安装完成后弹出提示
  MessageBox MB_OK "安装完成！"
  ;Quit
FunctionEnd

Function .onInit
  ; 程序启动时弹出对话框，询问是否继续安装
  MessageBox MB_YESNO|MB_ICONQUESTION "是否要安装98五笔字体支持？" IDNO cancelInstall
  Return

cancelInstall:
  ; 如果用户选择“否”，则退出安装
  Quit
FunctionEnd