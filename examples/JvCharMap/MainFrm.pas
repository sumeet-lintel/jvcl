unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, JvCharMap, StdCtrls, ExtCtrls, ComCtrls, JvColorCombo,
  JvCombobox, Menus;

type
  TForm1 = class(TForm)
    FontDialog1: TFontDialog;
    Panel1: TPanel;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    udStart: TUpDown;
    Label2: TLabel;
    Edit2: TEdit;
    udEnd: TUpDown;
    Label3: TLabel;
    Edit3: TEdit;
    udColumns: TUpDown;
    JvColorComboBox1: TJvColorComboBox;
    JvFontComboBox1: TJvFontComboBox;
    CheckBox2: TCheckBox;
    RichEdit1: TRichEdit;
    PopupMenu1: TPopupMenu;
    Copy1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure udStartClick(Sender: TObject; Button: TUDBtnType);
    procedure udEndClick(Sender: TObject; Button: TUDBtnType);
    procedure udColumnsClick(Sender: TObject; Button: TUDBtnType);
    procedure JvFontComboBox1Change(Sender: TObject);
    procedure JvColorComboBox1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DoJMKeyUp(Sender:TObject; var Key:word;Shift:TShiftState);
    procedure DoJMMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure DisplayInfo;
  public
    { Public declarations }
    JM:TJvCharMap;
    procedure AfterConstruction; override;

  end;

var
  Form1: TForm1;

implementation
uses
  Clipbrd;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  JM := TJvCharMap.Create(self);
//  JM.Align := alClient;
  JM.Parent := self;
  JM.EndChar := 512;
  JM.OnKeyUp := DoJMKeyUp;
  JM.OnMouseUp := DoJMMouseUp;
  
  JM.ClientWidth := JM.CellSize.cx * JM.Columns + JM.Columns;
  JM.Left := (ClientWidth - JM.Width) div 2;
  JM.Top := 8;
  JM.Height := Panel1.Top - JM.Top - 20;
  JM.Anchors := [akTop, akBottom];
//  JM.AutoSizeColumns := true;
  JM.PopupMenu := PopupMenu1;
  CheckBox1.Checked := JM.ShowZoomPanel;
  udStart.Position := JM.StartChar;
  udEnd.Position := JM.EndChar;
  udColumns.Position := JM.Columns;
  JvColorComboBox1.ColorValue := JM.Color;
  JvFontComboBox1.Fontname := JM.Font.Name;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FontDialog1.Font := JM.Font;
  if FontDialog1.Execute then
  begin
    JM.Font := FontDialog1.Font;
    JvFontComboBox1.Fontname := JM.Font.Name;
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  JM.ShowZoomPanel := CheckBox1.Checked;
end;

procedure TForm1.DoJMMouseUp(Sender: TObject; Button:TMouseButton; Shift:TShiftState; X, Y:integer);
begin
  DisplayInfo;
end;

procedure TForm1.DoJMKeyUp(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  DisplayInfo;
end;

procedure TForm1.udStartClick(Sender: TObject; Button: TUDBtnType);
begin
  JM.StartChar := udStart.Position;
end;

procedure TForm1.udEndClick(Sender: TObject; Button: TUDBtnType);
begin
  JM.EndChar := udEnd.Position;
end;

procedure TForm1.udColumnsClick(Sender: TObject; Button: TUDBtnType);
begin
  JM.Columns := udColumns.Position;
end;

function GetTypeString1(AChar:WideChar):WideString;
var ACharInfo:word;
begin
  Result := '';
  if GetStringTypeExW(LOCALE_USER_DEFAULT, CT_CTYPE1, @AChar, 1, ACharInfo) then
  begin
    if ACharInfo and C1_UPPER = C1_UPPER then
      Result := Result + ',C1_UPPER';
    if ACharInfo and C1_LOWER = C1_LOWER then
      Result := Result + ',C1_LOWER';
    if ACharInfo and C1_DIGIT = C1_DIGIT then
      Result := Result + ',C1_DIGIT';
    if ACharInfo and C1_SPACE = C1_SPACE then
      Result := Result + ',C1_SPACE';
    if ACharInfo and C1_PUNCT = C1_PUNCT then
      Result := Result + ',C1_PUNCT';
    if ACharInfo and C1_CNTRL = C1_CNTRL then
      Result := Result + ',C1_CNTRL';
    if ACharInfo and C1_BLANK = C1_BLANK then
      Result := Result + ',C1_BLANK';
    if ACharInfo and C1_XDIGIT = C1_XDIGIT then
      Result := Result + ',C1_XDIGIT';
    if ACharInfo and C1_ALPHA = C1_ALPHA then
      Result := Result + ',C1_ALPHA';
  end;
  if Result <> '' then
    Result := Copy(Result, 2, MaxInt);
end;

function GetTypeString2(AChar:WideChar):WideString;
var ACharInfo:word;
begin
  Result := '';
  if GetStringTypeExW(LOCALE_USER_DEFAULT, CT_CTYPE2, @AChar, 1, ACharInfo) then
  begin
    if ACharInfo and C2_LEFTTORIGHT	 = C2_LEFTTORIGHT	 then
      Result := Result + ',C2_LEFTTORIGHT';
    if ACharInfo and C2_RIGHTTOLEFT		 = C2_RIGHTTOLEFT	 then
      Result := Result + ',C2_RIGHTTOLEFT';
    if ACharInfo and C2_EUROPENUMBER	 = C2_EUROPENUMBER	 then
      Result := Result + ',C2_EUROPENUMBER';
    if ACharInfo and C2_EUROPESEPARATOR	 = C2_EUROPESEPARATOR	 then
      Result := Result + ',C2_EUROPESEPARATOR';
    if ACharInfo and C2_EUROPETERMINATOR	 = C2_EUROPETERMINATOR	 then
      Result := Result + ',C2_EUROPETERMINATOR';
    if ACharInfo and C2_ARABICNUMBER	 = C2_ARABICNUMBER	then
      Result := Result + ',C2_ARABICNUMBER';
    if ACharInfo and C2_COMMONSEPARATOR	 = C2_COMMONSEPARATOR	 then
      Result := Result + ',C2_COMMONSEPARATOR';
    if ACharInfo and C2_BLOCKSEPARATOR	 = C2_BLOCKSEPARATOR	then
      Result := Result + ',C2_BLOCKSEPARATOR';
    if ACharInfo and C2_SEGMENTSEPARATOR	 = C2_SEGMENTSEPARATOR	then
      Result := Result + ',C2_SEGMENTSEPARATOR';
    if ACharInfo and C2_WHITESPACE = C2_WHITESPACE then
      Result := Result + ',C2_WHITESPACE';
    if ACharInfo and C2_OTHERNEUTRAL		 = C2_OTHERNEUTRAL	 then
      Result := Result + ',C2_OTHERNEUTRAL';
  end;
  if Result <> '' then
    Result := Copy(Result, 2, MaxInt);
end;

function GetTypeString3(AChar:WideChar):WideString;
var ACharInfo:word;
begin
  Result := '';
  if GetStringTypeExW(LOCALE_USER_DEFAULT, CT_CTYPE3, @AChar, 1, ACharInfo) then
  begin
    if ACharInfo and C3_NONSPACING		 = C3_NONSPACING	 then
      Result := Result + ',C3_NONSPACING';
    if ACharInfo and C3_DIACRITIC = C3_DIACRITIC then
      Result := Result + ',C3_DIACRITIC ';
    if ACharInfo and C3_VOWELMARK = C3_VOWELMARK then
      Result := Result + ',C3_VOWELMARK';
    if ACharInfo and C3_SYMBOL = C3_SYMBOL then
      Result := Result + ',C3_SYMBOL';
    if ACharInfo and C3_KATAKANA = C3_KATAKANA then
      Result := Result + ',C1_PUNCT';
    if ACharInfo and C3_HIRAGANA = C3_HIRAGANA then
      Result := Result + ',C3_HIRAGANA';
    if ACharInfo and C3_HALFWIDTH = C3_HALFWIDTH then
      Result := Result + ',C3_HALFWIDTH';
    if ACharInfo and C3_FULLWIDTH = C3_FULLWIDTH then
      Result := Result + ',C3_FULLWIDTH';
    if ACharInfo and C3_IDEOGRAPH = C3_IDEOGRAPH then
      Result := Result + ',C3_IDEOGRAPH';
    if ACharInfo and C3_KASHIDA = C3_KASHIDA then
      Result := Result + ',C3_KASHIDA';
    if ACharInfo and C3_ALPHA = C3_ALPHA then
      Result := Result + ',C3_ALPHA';
  end;
  if Result <> '' then
    Result := Copy(Result, 2, MaxInt);
end;

procedure TForm1.DisplayInfo;
begin
  RichEdit1.Clear;
  RichEdit1.Lines.Add('Character Type: ' + GetTypeString1(JM.Character));
  RichEdit1.Lines.Add('Bidirectional Layout: ' + GetTypeString2(JM.Character));
  RichEdit1.Lines.Add('Text Processing:' + GetTypeString3(JM.Character));
  RichEdit1.Lines.Add(Format('Keyboard Code: U+%.4x',[Ord(JM.Character)]));
end;

procedure TForm1.JvFontComboBox1Change(Sender: TObject);
begin
  if JM <> nil then
    JM.Font.Name := JvFontComboBox1.FontName;
end;

procedure TForm1.JvColorComboBox1Change(Sender: TObject);
begin
  if JM <> nil then
    JM.Color := JvColorComboBox1.ColorValue;
end;

procedure TForm1.AfterConstruction;
begin
  inherited;
  JvFontComboBox1.FontName := JM.Font.Name;
  JvColorComboBox1.ColorValue := JM.Color;
  JvColorComboBox1.OnChange := JvColorComboBox1Change;
  JvFontComboBox1.OnChange := JvFontComboBox1Change;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    JM.EndChar := $FEFF
  else
    JM.EndChar := udEnd.Position;
end;

procedure TForm1.Copy1Click(Sender: TObject);
begin
  Clipboard.AsText := WideString(JM.Character);
end;

end.
