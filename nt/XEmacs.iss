; This script generates an installation kit for a Windows-native XEmacs, version 21.4.
; This script runs with Inno Setup version 5.1.6, see http://www.jrsoftware.org/ for more info.
;
; Version History
; 2006-01-26  Vin Shelton <acs@xemacs.org>    Don't append XEmacs binary directory to system path.
; 2006-01-21  Vin Shelton <acs@xemacs.org>    Append XEmacs binary directory to system path; this is not currently deleted on uninstall.
;                                             Get built kit from C:\XEmacs-built.
; 2005-12-26  Vin Shelton <acs@xemacs.org>    Packages are now installed directly into {app}\xemacs-packages, etc.  As of 21.4.19, the package root is found automatically, so EMACSPACKAGEPATH is no longer necessary.
; 2005-12-17  Vin Shelton <acs@xemacs.org>    Move packages out of the version-specific tree
; 2005-12-13  Vin Shelton <acs@xemacs.org>    Created.

[Setup]
AppName=XEmacs
AppVersion={code:XEmacsVersion}
AppVerName=XEmacs {code:XEmacsVersion}
AppPublisher=The XEmacs Development Team
AppPublisherURL=http://www.xemacs.org
AppSupportURL=http://www.xemacs.org
AppUpdatesURL=http://www.xemacs.org
DefaultDirName={pf}\XEmacs
DefaultGroupName=XEmacs
AllowNoIcons=yes
OutputDir=.
OutputBaseFilename=XEmacs Setup 21.4.19
Compression=lzma
SolidCompression=yes
InfoAfterFile=README

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; Before you run this script, XEmacs-21.4 must be installed in C:\XEmacs-built\XEmacs-21.4.xx
; and any packages you want to include must be installed in C:\XEmacs-built\{xemacs,mule,site}-packages
Source: "C:\XEmacs-built\*"; Excludes: "C:\XEmacs-built\XEmacs-21.5*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[INI]
Filename: "{app}\xemacs.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://www.xemacs.org"

[Icons]
Name: "{group}\XEmacs"; Filename: "{app}\XEmacs-{code:XEmacsVersion}\i586-pc-win32\xemacs.exe"
Name: "{group}\{cm:ProgramOnTheWeb,XEmacs}"; Filename: "{app}\xemacs.url"
Name: "{group}\{cm:UninstallProgram,XEmacs}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\XEmacs"; Filename: "{app}\XEmacs-{code:XEmacsVersion}\i586-pc-win32\xemacs.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\XEmacs"; Filename: "{app}\XEmacs-{code:XEmacsVersion}\i586-pc-win32\xemacs.exe"; Tasks: quicklaunchicon

[Registry]
; Set a registry key to point to the packages so they can be shared between multiple installed versions of XEmacs
; This is no longer necessary as of version 21.4.19.
;Root: HKLM; Subkey: "Software\XEmacs\XEmacs"; ValueType: string; ValueName: "EMACSPACKAGEPATH"; ValueData: "{app}\Packages"; Flags: uninsdeletekey
; Don't fiddle with the system path
;Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\XEmacs-{code:XEmacsVersion}\i586-pc-win32"


[Run]
Filename: "{app}\XEmacs-{code:XEmacsVersion}\i586-pc-win32\xemacs.exe"; Description: "{cm:LaunchProgram,XEmacs}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\xemacs.url"

[Code]
function XEmacsVersion(Param: String): String;
begin
  Result := '21.4.19';
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  BinDir: String;
  EtcDir: String;
  InstallBase: String;
  SiteStart: String;
begin

  // Create a site-start.el file to allow easy package downloading in the future and to add the binary directory to exec-path.
  // E.g, here's what we're going to add to lisp\site-start.el:
  //   (setq package-get-package-index-file-location "C:\\Program Files\XEmacs\\XEmacs-21.4.98\\etc")
  //   ; Uncomment the next line to select the primary XEmacs package download site
  //   ;(setq package-get-remote '("ftp.xemacs.org" "pub/xemacs/packages"))
  if CurStep = ssPostInstall then begin

    // Convert directory names to lisp format by doubling each backslash
    InstallBase := WizardDirValue + '\XEmacs-' + XEmacsVersion('');
    StringChange(InstallBase, '\', '\\');
    EtcDir := InstallBase + '\\etc';
    //BinDir := InstallBase + '\\i586-pc-win32\\';

    SiteStart := WizardDirValue + '\site-packages\lisp';
    CreateDir(SiteStart);
    SiteStart := SiteStart + '\site-start.el';
    
    SaveStringToFile(SiteStart, #13#10 + '(setq package-get-package-index-file-location "' + EtcDir + '")' + #13#10, True);
    SaveStringToFile(SiteStart, '; Uncomment the next line to select the primary XEmacs package download site' + #13#10, True);
    SaveStringToFile(SiteStart, ';(setq package-get-remote ' + Chr(39) + '("ftp.xemacs.org" "pub/xemacs/packages"))' + #13#10, True);
    
    //SaveStringToFile(SiteStart, '(pushnew "' + BinDir + '" exec-path)' + #13#10, True);
  end;
end;


