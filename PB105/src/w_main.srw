$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type uo_1 from uo_treeview within w_main
end type
type dw_1 from datawindow within w_main
end type
end forward

global type w_main from window
integer x = 823
integer y = 360
integer width = 1833
integer height = 1088
boolean titlebar = true
string title = "dropdown TreeView"
boolean controlmenu = true
long backcolor = 80269524
uo_1 uo_1
dw_1 dw_1
end type
global w_main w_main

type variables
long il_row
end variables

on w_main.create
this.uo_1=create uo_1
this.dw_1=create dw_1
this.Control[]={this.uo_1,&
this.dw_1}
end on

on w_main.destroy
destroy(this.uo_1)
destroy(this.dw_1)
end on

event open;uo_1.hide( )
Long ll_row
ll_row = dw_1.InsertRow(0)
dw_1.ScrollToRow(ll_row)
dw_1.SetFocus()

end event

type uo_1 from uo_treeview within w_main
integer x = 905
integer y = 196
integer taborder = 20
boolean border = false
long backcolor = 80269524
end type

on uo_1.destroy
call uo_treeview::destroy
end on

type dw_1 from datawindow within w_main
event ue_dropdown pbm_dwndropdown
integer x = 14
integer y = 8
integer width = 1787
integer height = 880
integer taborder = 10
string dataobject = "d_test"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_dropdown;String ls_column
Long ll_pointx, ll_pointy
ls_column = This.GetColumnName()
Choose Case ls_column
	Case "one" , "two"
		ll_pointx = Long(This.Describe(ls_column + ".X"))  +  This.X
		ll_pointy = Long(This.Describe(ls_column + ".Y")) + Long(This.Describe(ls_column+ ".Height")) + 5 +  This.Y
		uo_1.Move( ll_pointx ,ll_pointy)
End Choose
uo_1.idw_request = This
uo_1.il_row = il_row
uo_1.is_dwo = ls_column

uo_1.TriggerEvent("ue_postopen")
uo_1.Show()
uo_1.SetFocus()
Return 1


end event

event rowfocuschanged;il_row=currentrow
end event

event clicked;uo_1.hide()
end event

