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

The Original Code is: JvColorBar.PAS, released on 2004-03-15.

The Initial Developer of the Original Code is Stefano Pessina [pessina@tntdeveloping.com]
Portions created by Stefano Pessina are Copyright (C) 2004 Stefano Pessina.
All Rights Reserved.

Contributor(s):

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

{$I jvcl.inc}

{ Description. }

unit JvQColorTrackbar;

interface

uses
  SysUtils, Classes,
  
  
  Types, QControls, QGraphics, QForms, QWindows,
  
  JvQComponent;

type
  
  TJvColorTrackBarIndicator = (tbiArrow, tbiLine);
  TJvColorTrackBarIndicators = set of TJvColorTrackBarIndicator;
  TJvColorTrackBar = class(TJvGraphicControl)
  private
    //FShowValue: boolean;
    FPosition, FMin, FMax: integer;
    FButtonDown: boolean;
    FOnPosChanged: TNotifyEvent;
    BmpImage: TBitmap;
    FColorFrom: TColor;
    FColorTo: TColor;
    FArrowColor: TColor;
    FOnMaxChange: TNotifyEvent;
    FOnMinChange: TNotifyEvent;
    FBorderStyle: TControlBorderStyle;
    FReadOnly: boolean;
    FIndicators: TJvColorTrackBarIndicators;
    procedure SetPosition(const Value: integer);
    procedure SetMax(const Value: integer);
    procedure SetMin(const Value: integer);
    procedure SetColorFrom(const Value: TColor);
    procedure SetColorTo(const Value: TColor);
    procedure SetArrowColor(const Value: TColor);
    procedure SetBorderStyle(const Value: TControlBorderStyle);
    procedure SetIndicators(const Value: TJvColorTrackBarIndicators);
  protected
    procedure Changed; virtual;
    procedure MinChanged; virtual;
    procedure MaxChanged; virtual;
    procedure Paint; override;
  public
    procedure UpdateGradient;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Resize; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: integer); override;
    function XToPos(X: integer): integer;
    function PosToX(APos: integer): integer;
  published
    property Indicators:TJvColorTrackBarIndicators read FIndicators write SetIndicators default [tbiArrow, tbiLine];
    property ArrowColor: TColor read FArrowColor write SetArrowColor default clBlack;

    property BorderStyle: TControlBorderStyle read FBorderStyle write SetBorderStyle;

    property ColorFrom: TColor read FColorFrom write SetColorFrom default clBlack;
    property ColorTo: TColor read FColorTo write SetColorTo default clBlue;
    property Min: integer read FMin write SetMin default 0;
    property Max: integer read FMax write SetMax default 100;
    property Position: integer read FPosition write SetPosition default 0;
    property ReadOnly:boolean read FReadOnly write FReadOnly default False;
    property OnPosChange: TNotifyEvent read FOnPosChanged write FOnPosChanged;
    property OnMinChange: TNotifyEvent read FOnMinChange write FOnMinChange;
    property OnMaxChange: TNotifyEvent read FOnMaxChange write FOnMaxChange;

    property Align;
    property Anchors;
    property Color;
    property Constraints;
    
    property DragMode;
    property Hint;
    property ParentColor;
    property PopupMenu;
    property ParentShowHint;
    property ShowHint;
    property Height default 24;
    property Width default 120;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    
    property OnStartDrag;
  end;

implementation
uses
  JvQJVCLUtils;

const
  TopOffset = 8;
  WidthOffset = 4;

procedure TJvColorTrackBar.UpdateGradient;
var
  R: TRect;
begin
  if Parent = nil then Exit;
  BmpImage.PixelFormat := pf24bit;
  BmpImage.Width := Width - WidthOffset;
  BmpImage.Height := Height - TopOffset;
  R := Rect(0, 0, BmpImage.Width, BmpImage.Height);

  
  BmpImage.Canvas.Start;
  
  GradientFillRect(BmpImage.Canvas, R, ColorFrom, ColorTo, fdLeftToRight, 255);
  if BorderStyle = bsSingle then
    DrawEdge(BmpImage.Canvas.Handle, R, EDGE_SUNKEN, BF_TOP or BF_RIGHT or BF_BOTTOM or BF_LEFT);
  
  BmpImage.Canvas.Stop;
  

end;

constructor TJvColorTrackBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csOpaque];
  BmpImage := TBitmap.Create;
  FMin := 0;
  FMax := 100;
  FPosition := 0;
  FColorFrom := clBlack;
  FColorTo := clBlue;
  FArrowColor := clBlack;
  FBorderStyle := bsSingle;
  FIndicators := [tbiArrow, tbiLine];
  Height := 24;
  Width := 120;
  UpdateGradient;
end;

destructor TJvColorTrackBar.Destroy;
begin
  BmpImage.Free;
  inherited;
end;

procedure TJvColorTrackBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) then
  begin
    FButtonDown := not ReadOnly;
    Position := XToPos(X);
  end;
end;

procedure TJvColorTrackBar.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if (FButtonDown) then
    Position := XToPos(X);
end;

procedure TJvColorTrackBar.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if (Button = mbLeft) and FButtonDown then
    Position := XToPos(X);
  FButtonDown := false;
end;

procedure TJvColorTrackBar.Paint;
var
  X: integer;
  R: TRect;
  P: array of TPoint;
begin
  if Parent = nil then Exit;
  if (Height - TopOffset <> BmpImage.Height) or (Width <> BmpImage.Width - WidthOffset) then
    UpdateGradient;
  Canvas.Pen.Color := Color;
  Canvas.Brush.Color := Color;
  
  Canvas.Draw(WidthOffset div 2, TopOffset, BmpImage);
  
  
  R := Rect(0, 0, Width, TopOffset);
  Canvas.FillRect(R);
  X := PosToX(Position);
  if tbiArrow in Indicators then
  begin
    Canvas.Pen.Color := ArrowColor;
    Canvas.Brush.Color := ArrowColor;
    SetLength(P, 3);
    P[0] := Point(X - 5, 0);
    P[1] := Point(X, 5);
    P[2] := Point(X + 5, 0);
    Canvas.Polygon(P);
  end;
  if tbiLine in Indicators then
  begin
    Canvas.Pen.Color := Canvas.Pixels[X, TopOffset + 4] xor clWhite;
    Canvas.MoveTo(X - 1, TopOffset + Ord(BorderStyle = bsSingle) * 2);
    Canvas.LineTo(X - 1, Height - Ord(BorderStyle = bsSingle) * 2);
    Canvas.MoveTo(X, TopOffset + Ord(BorderStyle = bsSingle) * 2);
    Canvas.LineTo(X, Height - Ord(BorderStyle = bsSingle) * 2);
    Canvas.MoveTo(X + 1, TopOffset + Ord(BorderStyle = bsSingle) * 2);
    Canvas.LineTo(X + 1, Height - Ord(BorderStyle = bsSingle) * 2);
  end;
end;

procedure TJvColorTrackBar.Resize;
begin
  inherited;
  UpdateGradient;
end;

procedure TJvColorTrackBar.SetMax(const Value: integer);
begin
  if Value > Min then
  begin
    FMax := Value;
    if FMax < Position then
      Position := FMax;
    Invalidate;
    MaxChanged;
  end;
end;

procedure TJvColorTrackBar.SetMin(const Value: integer);
begin
  if Value < Max then
  begin
    FMin := Value;
    if FMin > Position then
      Position := FMin;
    Invalidate;
    MinChanged;
  end;
end;

procedure TJvColorTrackBar.SetPosition(const Value: integer);
begin
  if (Value >= Min) and (Value <= Max) and (Value <> FPosition) then
  begin
    FPosition := Value;
    Invalidate;
    Changed;
  end;
end;

procedure TJvColorTrackBar.Changed;
begin
  if Assigned(FOnPosChanged) then
    FOnPosChanged(Self);
end;

procedure TJvColorTrackBar.SetColorFrom(const Value: TColor);
begin
  if FColorFrom <> Value then
  begin
    FColorFrom := Value;
    UpdateGradient;
    Invalidate;
  end;
end;

procedure TJvColorTrackBar.SetColorTo(const Value: TColor);
begin
  if FColorTo <> Value then
  begin
    FColorTo := Value;
    UpdateGradient;
    Invalidate;
  end;
end;

function TJvColorTrackBar.XToPos(X: integer): integer;
begin
  if (Max - Min > 0) and (Width - WidthOffset > 0) then
    Result := X * (Max - Min) div (Width - WidthOffset) + Min
  else
    Result := Min;
  if Result < Min then Result := Min;
  if Result > Max then Result := Max;
end;

function TJvColorTrackBar.PosToX(APos: integer): integer;
begin
  if (Max - Min > 0) and (Width > 0) then
    Result := Width * (APos - Min) div (Max - Min)
  else
    Result := WidthOffset;
  if Result < WidthOffset * 2 then Result := WidthOffset * 2;
  if Result > Width - WidthOffset * 2 then Result := Width - WidthOffset * 2;
end;

procedure TJvColorTrackBar.SetArrowColor(const Value: TColor);
begin
  if FArrowColor <> Value then
  begin
    FArrowColor := Value;
    Invalidate;
  end;
end;

procedure TJvColorTrackBar.MaxChanged;
begin
  if Assigned(FOnMaxChange) then
    FOnMaxChange(Self);
end;

procedure TJvColorTrackBar.MinChanged;
begin
  if Assigned(FOnMinChange) then
    FOnMinChange(Self);
end;

procedure TJvColorTrackBar.SetBorderStyle(const Value: TControlBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    Invalidate;
  end;
end;

procedure TJvColorTrackBar.SetIndicators(const Value: TJvColorTrackBarIndicators);
begin
  if FIndicators <> Value then
  begin
    FIndicators := Value;
    Invalidate;
  end;
end;

end.

