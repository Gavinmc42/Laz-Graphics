{
 ***************************************************************************
 *                                                                         *
 *   This source is free software; you can redistribute it and/or modify   *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This code is distributed in the hope that it will be useful, but      *
 *   WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU     *
 *   General Public License for more details.                              *
 *                                                                         *
 *   A copy of the GNU General Public License is available on the World    *
 *   Wide Web at <http://www.gnu.org/copyleft/gpl.html>. You can also      *
 *   obtain it by writing to the Free Software Foundation,                 *
 *   Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1335, USA.   *
 *                                                                         *
 ***************************************************************************
}
program loadpicture;

{$mode objfpc}{$H+}

uses
  Interfaces,
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  LResources,
  ExtCtrls;
  
type
  TLoadBitmapForm = class(TForm)
    Image1: TImage;
    Image2: TImage;

  public
    constructor Create(TheOwner: TComponent); override;
  end;

{ TLoadBitmapForm }

constructor TLoadBitmapForm.Create(TheOwner: TComponent);
var
  Filename0: String;
  Filename1: String;

  //Graphics1 : TGraphics;

begin
  inherited CreateNew(TheOwner, 1);
  
  Filename0:=SetDirSeparators('greenbg.bmp');
  Filename1:=SetDirSeparators('griff.png');

  //Caption := 'Example: Loading picture from file';
  Width := 1356;
  Height := 770;
  Position:= poScreenCenter;

  //Graphics1:=TGraphics.Create;
  //Canvas1.SetSize(Width, Height, Canvas1.ColourFormat);

  Image1:=TImage.Create(Self);
  with Image1 do begin
    //Name:='Image1';
    Parent:=Self;
    Align:=alClient;
    Picture.LoadFromFile( Filename0);
  end;
  Position:= poScreenCenter;
  Image2:=TImage.Create(Self);
  with Image2 do begin
    //Name:='Image1';
    Parent:=Self;
    Align:=alClient;
    Picture.LoadFromFile(Filename1);
    //Canvas1.DoLine(120,102,200,300, 20);
  end;

  //Graphics1.DoLine(100,100,200,200,100);
  //Canvas1.TextOut(100,200, 'hello');


end;

var
  LoadBitmapForm: TLoadBitmapForm;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLoadBitmapForm,LoadBitmapForm);
  Application.Run;
end.

