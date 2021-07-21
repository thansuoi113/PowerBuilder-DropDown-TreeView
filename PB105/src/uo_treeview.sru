$PBExportHeader$uo_treeview.sru
forward
global type uo_treeview from userobject
end type
type tv_1 from treeview within uo_treeview
end type
end forward

global type uo_treeview from userobject
integer width = 1029
integer height = 756
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_postopen ( )
event key pbm_keydown
tv_1 tv_1
end type
global uo_treeview uo_treeview

type variables
String is_id,is_label
datawindow idw_request
Long il_row
String is_dwo

end variables

event ue_postopen();treeviewitem ltvi_root
tv_1.DeleteItem(0)
is_id = ""
is_label = ""

ltvi_root.Data = "root"
ltvi_root.Label = "Root"
ltvi_root.PictureIndex = 1
ltvi_root.SelectedPictureIndex = 2
ltvi_root.Children = True
tv_1.InsertItemLast(0,ltvi_root)


end event

event key;If Key = keyescape! Then
	idw_request.SetItem(il_row,is_dwo,"")
End If

If Key = keyenter! Then
	idw_request.SetItem(il_row,is_dwo,is_id)
End If

This.Hide()
idw_request.SetFocus()

end event

on uo_treeview.create
this.tv_1=create tv_1
this.Control[]={this.tv_1}
end on

on uo_treeview.destroy
destroy(this.tv_1)
end on

type tv_1 from treeview within uo_treeview
integer x = 14
integer y = 4
integer width = 992
integer height = 732
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
string picturename[] = {"Custom039!","Custom050!"}
long picturemaskcolor = 553648127
long statepicturemaskcolor = 536870912
end type

event itempopulate;int i
treeviewitem ltvi_new,ltvi_place

if this.getitem(handle,ltvi_place)<1 then return

choose case ltvi_place.level
 case 1
	for i=1 to 5
		ltvi_new.data="2"+string(i)
   	ltvi_new.label="Second"+string(i)
   	ltvi_new.pictureindex=1
		ltvi_new.selectedpictureindex=2
		ltvi_new.children=true
		this.insertitemlast(handle,ltvi_new)

	next
case 2
	for i=1 to 3
		ltvi_new.data="3"+string(i)
   	ltvi_new.label="Third"+string(i)
   	ltvi_new.pictureindex=1
		ltvi_new.selectedpictureindex=2
		ltvi_new.children=false
		this.insertitemlast(handle,ltvi_new)

	next
end choose
end event

event selectionchanged;treeviewitem ltvi_place

if this.getitem(newhandle,ltvi_place)<1 then return
is_id=ltvi_place.data
is_label=ltvi_place.label
idw_request.setitem(il_row,is_dwo,is_id)
end event

