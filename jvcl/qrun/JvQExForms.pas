{**************************************************************************************************}
{  WARNING:  JEDI preprocessor generated unit.  Do not edit.                                       }
{**************************************************************************************************}

{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvExForms.pas, released on 2004-01-04

The Initial Developer of the Original Code is Andreas Hausladen [Andreas dott Hausladen att gmx dott de]
Portions created by Andreas Hausladen are Copyright (C) 2004 Andreas Hausladen.
All Rights Reserved.

Contributor(s): -

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

{$I jvcl.inc}
{MACROINCLUDE JvExControls.macros}

{*****************************************************************************
 * WARNING: Do not edit this file.
 * This file is autogenerated from the source in devtools/JvExVCL/src.
 * If you do it despite this warning your changes will be discarded by the next
 * update of this file. Do your changes in the template files.
 ****************************************************************************}

unit JvQExForms;
interface
uses
  
  
  Qt, QGraphics, QControls, QForms, QToolWin, Types, QWindows,
  
  Classes, SysUtils,
  JvQTypes, JvQThemes, JVQCLVer, JvQExControls;



 {$IF not declared(PatchedVCLX)}
  
 {$IFEND}


type
  TJvExScrollingWinControl = class(TScrollingWinControl, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  
  
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    function GetDoubleBuffered: Boolean;
    procedure ColorChanged; override;
  published
    property DoubleBuffered: Boolean read GetDoubleBuffered write FDoubleBuffered;
  
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  
  
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubScrollingWinControl = class(TJvExScrollingWinControl)
  
  end;
  
  TJvExScrollBox = class(TScrollBox, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  
  
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    function GetDoubleBuffered: Boolean;
    procedure ColorChanged; override;
  published
    property DoubleBuffered: Boolean read GetDoubleBuffered write FDoubleBuffered;
  
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  
  
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubScrollBox = class(TJvExScrollBox)
  
  end;
  
  TJvExCustomFrame = class(TCustomFrame, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  
  
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    function GetDoubleBuffered: Boolean;
    procedure ColorChanged; override;
  public
    property DoubleBuffered: Boolean read GetDoubleBuffered write FDoubleBuffered;
  
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  
  
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubCustomFrame = class(TJvExCustomFrame)
  
  end;
  
  TJvExFrame = class(TFrame, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  
  
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    function GetDoubleBuffered: Boolean;
    procedure ColorChanged; override;
  published
    property DoubleBuffered: Boolean read GetDoubleBuffered write FDoubleBuffered;
  
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  
  
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubFrame = class(TJvExFrame)
  
  end;
  
  TJvExCustomForm = class(TCustomForm,  IJvWinControlEvents, IJvCustomControlEvents, IJvControlEvents, IPerformControl)
  
  
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    function GetDoubleBuffered: Boolean;
    procedure ColorChanged; override;
  published
    property DoubleBuffered: Boolean read GetDoubleBuffered write FDoubleBuffered;
  
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  
  
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    destructor Destroy; override;
  end;
  TJvExPubCustomForm = class(TJvExCustomForm)
  
  end;
   // do not implement Painting() but CreateNew
  TJvExForm = class(TForm,  IJvWinControlEvents, IJvCustomControlEvents, IJvControlEvents, IPerformControl)
  
  
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    function GetDoubleBuffered: Boolean;
    procedure ColorChanged; override;
  published
    property DoubleBuffered: Boolean read GetDoubleBuffered write FDoubleBuffered;
  
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  
  
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    destructor Destroy; override;
  end;
  TJvExPubForm = class(TJvExForm)
  
  end;
   // do not implement Painting() but CreateNew
  TJvExToolWindow = class(TToolWindow, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  
  
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    function GetDoubleBuffered: Boolean;
    procedure ColorChanged; override;
  published
    property DoubleBuffered: Boolean read GetDoubleBuffered write FDoubleBuffered;
  
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  
  
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubToolWindow = class(TJvExToolWindow)
  
  end;
  

implementation



procedure TJvExScrollingWinControl.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExScrollingWinControl.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExScrollingWinControl.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExScrollingWinControl.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExScrollingWinControl.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExScrollingWinControl.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExScrollingWinControl.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
     Paint;
  end;
end;

function TJvExScrollingWinControl.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExScrollingWinControl.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExScrollingWinControl.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExScrollingWinControl.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

procedure TJvExScrollingWinControl.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExScrollingWinControl.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExScrollingWinControl.DoBoundsChanged;
begin
end;

procedure TJvExScrollingWinControl.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExScrollingWinControl.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExScrollingWinControl.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExScrollingWinControl.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExScrollingWinControl.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExScrollingWinControl.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExScrollingWinControl.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;



procedure TJvExScrollBox.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExScrollBox.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExScrollBox.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExScrollBox.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExScrollBox.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExScrollBox.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExScrollBox.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
     Paint;
  end;
end;

function TJvExScrollBox.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExScrollBox.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExScrollBox.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExScrollBox.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

procedure TJvExScrollBox.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExScrollBox.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExScrollBox.DoBoundsChanged;
begin
end;

procedure TJvExScrollBox.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExScrollBox.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExScrollBox.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExScrollBox.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExScrollBox.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExScrollBox.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExScrollBox.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;



procedure TJvExCustomFrame.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExCustomFrame.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExCustomFrame.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExCustomFrame.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExCustomFrame.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExCustomFrame.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExCustomFrame.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
     Paint;
  end;
end;

function TJvExCustomFrame.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExCustomFrame.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExCustomFrame.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExCustomFrame.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

procedure TJvExCustomFrame.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomFrame.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExCustomFrame.DoBoundsChanged;
begin
end;

procedure TJvExCustomFrame.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomFrame.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomFrame.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExCustomFrame.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExCustomFrame.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExCustomFrame.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCustomFrame.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;



procedure TJvExFrame.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExFrame.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExFrame.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExFrame.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExFrame.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExFrame.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExFrame.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
     Paint;
  end;
end;

function TJvExFrame.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExFrame.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExFrame.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExFrame.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

procedure TJvExFrame.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExFrame.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExFrame.DoBoundsChanged;
begin
end;

procedure TJvExFrame.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExFrame.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExFrame.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExFrame.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExFrame.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExFrame.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExFrame.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;





procedure TJvExCustomForm.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExCustomForm.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExCustomForm.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExCustomForm.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExCustomForm.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExCustomForm.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExCustomForm.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
    if False then Paint;
  end;
end;

function TJvExCustomForm.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExCustomForm.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExCustomForm.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExCustomForm.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

procedure TJvExCustomForm.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomForm.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExCustomForm.DoBoundsChanged;
begin
end;

procedure TJvExCustomForm.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomForm.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomForm.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExCustomForm.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;
constructor TJvExCustomForm.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  
  inherited CreateNew(AOwner, Dummy);
  FHintColor := clInfoBk;
  
end;

destructor TJvExCustomForm.Destroy;
begin
  
  inherited Destroy;
end;


procedure TJvExForm.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExForm.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExForm.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExForm.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExForm.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExForm.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExForm.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
    if False then Paint;
  end;
end;

function TJvExForm.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExForm.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExForm.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExForm.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

procedure TJvExForm.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExForm.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExForm.DoBoundsChanged;
begin
end;

procedure TJvExForm.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExForm.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExForm.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExForm.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;
constructor TJvExForm.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  
  inherited CreateNew(AOwner, Dummy);
  FHintColor := clInfoBk;
  
end;

destructor TJvExForm.Destroy;
begin
  
  inherited Destroy;
end;




procedure TJvExToolWindow.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExToolWindow.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExToolWindow.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExToolWindow.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExToolWindow.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExToolWindow.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExToolWindow.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
     Paint;
  end;
end;

function TJvExToolWindow.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExToolWindow.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExToolWindow.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExToolWindow.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

procedure TJvExToolWindow.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExToolWindow.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExToolWindow.DoBoundsChanged;
begin
end;

procedure TJvExToolWindow.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExToolWindow.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExToolWindow.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExToolWindow.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExToolWindow.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExToolWindow.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExToolWindow.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;


end.
