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

The Original Code is: JvExComboEdits.pas, released on 2004-01-19

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



unit JvQExComboEdits;
interface
uses
  Qt, QGraphics, QControls, QForms, Types, QComboEdits, QWindows,
  Classes, SysUtils,
  JvQTypes, JvQThemes, JVQCLVer, JvQExControls;



 {$IF not declared(PatchedVCLX)}
  
 {$IFEND}


type
  TJvExCustomComboEdit = class(TCustomComboEdit,  IJvEditControlEvents, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  
  
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
  
  private
    FClipboardCommands: TJvClipboardCommands;
    
    FEditRect: TRect; // EM_GETRECT
    procedure EMGetRect(var Msg: TMessage); message EM_GETRECT;
    procedure EMSetRect(var Msg: TMessage); message EM_SETRECT;
    
  protected
    procedure DoUndo; dynamic;
    procedure DoClearText; dynamic;
    procedure DoClipboardPaste; dynamic;
    procedure DoClipboardCopy; dynamic;
    procedure DoClipboardCut; dynamic;
    procedure SetClipboardCommands(const Value: TJvClipboardCommands); virtual;
    property ClipboardCommands: TJvClipboardCommands read FClipboardCommands
      write SetClipboardCommands default [caCopy..caUndo];
  
  public
    procedure Clear; override;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubCustomComboEdit = class(TJvExCustomComboEdit)
  
  end;
  
  TJvExComboEdit = class(TComboEdit,  IJvEditControlEvents, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  
  
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
  
  private
    FClipboardCommands: TJvClipboardCommands;
    
    FEditRect: TRect; // EM_GETRECT
    procedure EMGetRect(var Msg: TMessage); message EM_GETRECT;
    procedure EMSetRect(var Msg: TMessage); message EM_SETRECT;
    
  protected
    procedure DoUndo; dynamic;
    procedure DoClearText; dynamic;
    procedure DoClipboardPaste; dynamic;
    procedure DoClipboardCopy; dynamic;
    procedure DoClipboardCut; dynamic;
    procedure SetClipboardCommands(const Value: TJvClipboardCommands); virtual;
    property ClipboardCommands: TJvClipboardCommands read FClipboardCommands
      write SetClipboardCommands default [caCopy..caUndo];
  
  public
    procedure Clear; override;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubComboEdit = class(TJvExComboEdit)
  
  end;
  

  TJvExCustomComboMaskEdit = class(TCustomComboMaskEdit,  IJvEditControlEvents, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  
  
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
  
  private
    FClipboardCommands: TJvClipboardCommands;
    
    FEditRect: TRect; // EM_GETRECT
    procedure EMGetRect(var Msg: TMessage); message EM_GETRECT;
    procedure EMSetRect(var Msg: TMessage); message EM_SETRECT;
    
  protected
    procedure DoUndo; dynamic;
    procedure DoClearText; dynamic;
    procedure DoClipboardPaste; dynamic;
    procedure DoClipboardCopy; dynamic;
    procedure DoClipboardCut; dynamic;
    procedure SetClipboardCommands(const Value: TJvClipboardCommands); virtual;
    property ClipboardCommands: TJvClipboardCommands read FClipboardCommands
      write SetClipboardCommands default [caCopy..caUndo];
  
  public
    procedure Clear; override;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FBeepOnError: Boolean;
  protected
    procedure DoBeepOnError; dynamic;
    procedure SetBeepOnError(Value: Boolean); virtual;
    property BeepOnError: Boolean read FBeepOnError write SetBeepOnError default True;
  end;
  TJvExPubCustomComboMaskEdit = class(TJvExCustomComboMaskEdit)
  
  end;
  

  TJvExComboMaskEdit = class(TComboMaskEdit,  IJvEditControlEvents, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  
  
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
  
  private
    FClipboardCommands: TJvClipboardCommands;
    
    FEditRect: TRect; // EM_GETRECT
    procedure EMGetRect(var Msg: TMessage); message EM_GETRECT;
    procedure EMSetRect(var Msg: TMessage); message EM_SETRECT;
    
  protected
    procedure DoUndo; dynamic;
    procedure DoClearText; dynamic;
    procedure DoClipboardPaste; dynamic;
    procedure DoClipboardCopy; dynamic;
    procedure DoClipboardCut; dynamic;
    procedure SetClipboardCommands(const Value: TJvClipboardCommands); virtual;
    property ClipboardCommands: TJvClipboardCommands read FClipboardCommands
      write SetClipboardCommands default [caCopy..caUndo];
  
  public
    procedure Clear; override;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FBeepOnError: Boolean;
  protected
    procedure DoBeepOnError; dynamic;
    procedure SetBeepOnError(Value: Boolean); virtual;
    property BeepOnError: Boolean read FBeepOnError write SetBeepOnError default True;
  end;
  TJvExPubComboMaskEdit = class(TJvExComboMaskEdit)
  
  end;
  

implementation





procedure TJvExCustomComboEdit.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExCustomComboEdit.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExCustomComboEdit.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExCustomComboEdit.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
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

procedure TJvExCustomComboEdit.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExCustomComboEdit.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExCustomComboEdit.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
     Paint;
  end;
end;

function TJvExCustomComboEdit.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExCustomComboEdit.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExCustomComboEdit.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExCustomComboEdit.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

procedure TJvExCustomComboEdit.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomComboEdit.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExCustomComboEdit.DoBoundsChanged;
begin
end;

procedure TJvExCustomComboEdit.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomComboEdit.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomComboEdit.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExCustomComboEdit.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExCustomComboEdit.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FClipboardCommands := [caCopy..caUndo];
end;

destructor TJvExCustomComboEdit.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCustomComboEdit.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;


procedure TJvExCustomComboEdit.DoClearText;
begin
 // (ahuser) there is no caClear so we restrict it to caCut
  if caCut in ClipboardCommands then
    
    
    inherited Clear;
    
end;

procedure TJvExCustomComboEdit.DoUndo;
begin
  if caUndo in ClipboardCommands then
    TCustomEdit_Undo(Self);
end;

procedure TJvExCustomComboEdit.DoClipboardPaste;
begin
  if caPaste in ClipboardCommands then
    TCustomEdit_Paste(Self);
end;

procedure TJvExCustomComboEdit.DoClipboardCopy;
begin
  if caCopy in ClipboardCommands then
    TCustomEdit_Copy(Self);
end;

procedure TJvExCustomComboEdit.DoClipboardCut;
begin
  if caCut in ClipboardCommands then
    TCustomEdit_Cut(Self);
end;

procedure TJvExCustomComboEdit.SetClipboardCommands(const Value: TJvClipboardCommands);
begin
  FClipboardCommands := Value;
end;



procedure TJvExCustomComboEdit.Clear;
begin
  DoClearText;
end;

procedure TJvExCustomComboEdit.EMGetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
  begin
    if IsRectEmpty(FEditRect) then
    begin
      PRect(Msg.LParam)^ := ClientRect;
      if Self.BorderStyle = bsSingle then
        InflateRect(PRect(Msg.LParam)^, -2, -2);
    end
    else
      PRect(Msg.LParam)^ := FEditRect;
  end;
end;

procedure TJvExCustomComboEdit.EMSetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
    FEditRect := PRect(Msg.LParam)^
  else
    FEditRect := ClientRect;
  Invalidate;
end;







procedure TJvExComboEdit.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExComboEdit.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExComboEdit.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExComboEdit.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
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

procedure TJvExComboEdit.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExComboEdit.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExComboEdit.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
     Paint;
  end;
end;

function TJvExComboEdit.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExComboEdit.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExComboEdit.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExComboEdit.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

procedure TJvExComboEdit.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExComboEdit.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExComboEdit.DoBoundsChanged;
begin
end;

procedure TJvExComboEdit.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExComboEdit.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExComboEdit.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExComboEdit.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExComboEdit.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FClipboardCommands := [caCopy..caUndo];
end;

destructor TJvExComboEdit.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExComboEdit.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;


procedure TJvExComboEdit.DoClearText;
begin
 // (ahuser) there is no caClear so we restrict it to caCut
  if caCut in ClipboardCommands then
    
    
    inherited Clear;
    
end;

procedure TJvExComboEdit.DoUndo;
begin
  if caUndo in ClipboardCommands then
    TCustomEdit_Undo(Self);
end;

procedure TJvExComboEdit.DoClipboardPaste;
begin
  if caPaste in ClipboardCommands then
    TCustomEdit_Paste(Self);
end;

procedure TJvExComboEdit.DoClipboardCopy;
begin
  if caCopy in ClipboardCommands then
    TCustomEdit_Copy(Self);
end;

procedure TJvExComboEdit.DoClipboardCut;
begin
  if caCut in ClipboardCommands then
    TCustomEdit_Cut(Self);
end;

procedure TJvExComboEdit.SetClipboardCommands(const Value: TJvClipboardCommands);
begin
  FClipboardCommands := Value;
end;



procedure TJvExComboEdit.Clear;
begin
  DoClearText;
end;

procedure TJvExComboEdit.EMGetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
  begin
    if IsRectEmpty(FEditRect) then
    begin
      PRect(Msg.LParam)^ := ClientRect;
      if Self.BorderStyle = bsSingle then
        InflateRect(PRect(Msg.LParam)^, -2, -2);
    end
    else
      PRect(Msg.LParam)^ := FEditRect;
  end;
end;

procedure TJvExComboEdit.EMSetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
    FEditRect := PRect(Msg.LParam)^
  else
    FEditRect := ClientRect;
  Invalidate;
end;






{ The CONSTRUCTOR_CODE macro is used to extend the constructor by the macro
  content. }




procedure TJvExCustomComboMaskEdit.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExCustomComboMaskEdit.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExCustomComboMaskEdit.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExCustomComboMaskEdit.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
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

procedure TJvExCustomComboMaskEdit.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExCustomComboMaskEdit.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExCustomComboMaskEdit.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
     Paint;
  end;
end;

function TJvExCustomComboMaskEdit.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExCustomComboMaskEdit.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExCustomComboMaskEdit.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExCustomComboMaskEdit.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

procedure TJvExCustomComboMaskEdit.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomComboMaskEdit.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExCustomComboMaskEdit.DoBoundsChanged;
begin
end;

procedure TJvExCustomComboMaskEdit.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomComboMaskEdit.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomComboMaskEdit.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExCustomComboMaskEdit.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExCustomComboMaskEdit.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FBeepOnError := True;
  FClipboardCommands := [caCopy..caUndo];
end;

destructor TJvExCustomComboMaskEdit.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCustomComboMaskEdit.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;


procedure TJvExCustomComboMaskEdit.DoClearText;
begin
 // (ahuser) there is no caClear so we restrict it to caCut
  if caCut in ClipboardCommands then
    
    
    inherited Clear;
    
end;

procedure TJvExCustomComboMaskEdit.DoUndo;
begin
  if caUndo in ClipboardCommands then
    TCustomEdit_Undo(Self);
end;

procedure TJvExCustomComboMaskEdit.DoClipboardPaste;
begin
  if caPaste in ClipboardCommands then
    TCustomEdit_Paste(Self);
end;

procedure TJvExCustomComboMaskEdit.DoClipboardCopy;
begin
  if caCopy in ClipboardCommands then
    TCustomEdit_Copy(Self);
end;

procedure TJvExCustomComboMaskEdit.DoClipboardCut;
begin
  if caCut in ClipboardCommands then
    TCustomEdit_Cut(Self);
end;

procedure TJvExCustomComboMaskEdit.SetClipboardCommands(const Value: TJvClipboardCommands);
begin
  FClipboardCommands := Value;
end;



procedure TJvExCustomComboMaskEdit.Clear;
begin
  DoClearText;
end;

procedure TJvExCustomComboMaskEdit.EMGetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
  begin
    if IsRectEmpty(FEditRect) then
    begin
      PRect(Msg.LParam)^ := ClientRect;
      if Self.BorderStyle = bsSingle then
        InflateRect(PRect(Msg.LParam)^, -2, -2);
    end
    else
      PRect(Msg.LParam)^ := FEditRect;
  end;
end;

procedure TJvExCustomComboMaskEdit.EMSetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
    FEditRect := PRect(Msg.LParam)^
  else
    FEditRect := ClientRect;
  Invalidate;
end;




procedure TJvExCustomComboMaskEdit.DoBeepOnError;
begin
  if BeepOnError then
    SysUtils.Beep;
end;

procedure TJvExCustomComboMaskEdit.SetBeepOnError(Value: Boolean);
begin
  FBeepOnError := Value;
end;





procedure TJvExComboMaskEdit.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExComboMaskEdit.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExComboMaskEdit.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExComboMaskEdit.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
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

procedure TJvExComboMaskEdit.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExComboMaskEdit.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExComboMaskEdit.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
     Paint;
  end;
end;

function TJvExComboMaskEdit.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExComboMaskEdit.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExComboMaskEdit.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExComboMaskEdit.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;

procedure TJvExComboMaskEdit.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExComboMaskEdit.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExComboMaskEdit.DoBoundsChanged;
begin
end;

procedure TJvExComboMaskEdit.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExComboMaskEdit.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExComboMaskEdit.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExComboMaskEdit.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;


constructor TJvExComboMaskEdit.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FBeepOnError := True;
  FClipboardCommands := [caCopy..caUndo];
end;

destructor TJvExComboMaskEdit.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExComboMaskEdit.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;


procedure TJvExComboMaskEdit.DoClearText;
begin
 // (ahuser) there is no caClear so we restrict it to caCut
  if caCut in ClipboardCommands then
    
    
    inherited Clear;
    
end;

procedure TJvExComboMaskEdit.DoUndo;
begin
  if caUndo in ClipboardCommands then
    TCustomEdit_Undo(Self);
end;

procedure TJvExComboMaskEdit.DoClipboardPaste;
begin
  if caPaste in ClipboardCommands then
    TCustomEdit_Paste(Self);
end;

procedure TJvExComboMaskEdit.DoClipboardCopy;
begin
  if caCopy in ClipboardCommands then
    TCustomEdit_Copy(Self);
end;

procedure TJvExComboMaskEdit.DoClipboardCut;
begin
  if caCut in ClipboardCommands then
    TCustomEdit_Cut(Self);
end;

procedure TJvExComboMaskEdit.SetClipboardCommands(const Value: TJvClipboardCommands);
begin
  FClipboardCommands := Value;
end;



procedure TJvExComboMaskEdit.Clear;
begin
  DoClearText;
end;

procedure TJvExComboMaskEdit.EMGetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
  begin
    if IsRectEmpty(FEditRect) then
    begin
      PRect(Msg.LParam)^ := ClientRect;
      if Self.BorderStyle = bsSingle then
        InflateRect(PRect(Msg.LParam)^, -2, -2);
    end
    else
      PRect(Msg.LParam)^ := FEditRect;
  end;
end;

procedure TJvExComboMaskEdit.EMSetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
    FEditRect := PRect(Msg.LParam)^
  else
    FEditRect := ClientRect;
  Invalidate;
end;




procedure TJvExComboMaskEdit.DoBeepOnError;
begin
  if BeepOnError then
    SysUtils.Beep;
end;

procedure TJvExComboMaskEdit.SetBeepOnError(Value: Boolean);
begin
  FBeepOnError := Value;
end;


 // undefine at file end
end.
