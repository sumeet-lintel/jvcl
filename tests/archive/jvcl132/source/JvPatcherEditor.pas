{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvPatcherEditor.PAS, released on 2001-02-28.

The Initial Developer of the Original Code is Sébastien Buysse [sbuysse@buypin.com]
Portions created by Sébastien Buysse are Copyright (C) 2001 Sébastien Buysse.
All Rights Reserved.

Contributor(s): Michael Beck [mbeck@bigfoot.com].

Last Modified: 2000-02-28

You may retrieve the latest version of this file at the Project JEDI home page,
located at http://www.delphi-jedi.org

Known Issues:
-----------------------------------------------------------------------------}
{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$I JEDI.INC}

unit JvPatcherEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   {$IFDEF DELPHI5} DsgnIntf, {$ENDIF} {$IFDEF DELPHI6_UP} DesignEditors, DesignIntf, {$ENDIF}
  JvFormPatch;

type
  TJvPatcherEditor = class(TClassProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
    procedure Edit; override;
  end;

implementation

{*************************************************}

function TJvPatcherEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paDialog, paSortList];
end;

{*************************************************}

function TJvPatcherEditor.GetValue: string;
begin
  Result := GetStrValue;
end;

{*************************************************}

procedure TJvPatcherEditor.SetValue(const Value: string);
begin
  SetStrValue(Value);
end;

{*************************************************}

procedure TJvPatcherEditor.GetValues(Proc: TGetStrProc);
begin
  SetStrValue('Click to edit...');
end;

{*************************************************}

procedure TJvPatcherEditor.Edit;
var
  Dlg: TfoPatch;
  res: TStringList;
begin
  res := TStringList(GetOrdValue);
  Dlg := TfoPatch.Create(Application);
  Dlg.LoadFromStr(res);
  try
    if Dlg.ShowModal = mrOk then
    begin
      res.Assign(Dlg.SetFromStr);
      SetOrdValue(Integer(res));
    end;
  finally
    Dlg.Free;
  end;
end;

end.
