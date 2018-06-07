Imports System
Imports System.IO
Imports System.Text
Public Class Lista


    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim arqPets As String = "C:\teste\listaDePets.txt"
        Dim arqUser As String = "C:\teste\ListaDeUsers.txt"
        Dim tabela As New Table
        Dim aviso As New Label
        tabela.ID = "Table1"
        aviso.ID = "Label1"
        Dim aux As String = ""
        Dim valor As String = ""
        Dim coluna As New TableCell
        Dim linha As New TableRow
        Dim listaPets As New ArrayList
        tabela.CssClass = "table"

        If File.Exists(arqPets) Then

            Dim sr As StreamReader = File.OpenText(arqPets)
            Do While sr.Peek() >= 0
                listaPets.Add(sr.ReadLine())
                Debug.WriteLine(aux)
            Loop
            'nome,dono,id,appy, hunger,health, energy,toilet,sleeping
            ' petzinho,1,1,[80;5;90;90;5;False]
            For Each aux In listaPets
                Dim words() As String = aux.Split(",")
                Dim cont As Integer = 0
                For Each valor In words
                    If (cont = 2) Then
                        coluna = New TableCell
                        coluna.Text = "<button type=""text"" value=" + valor + """>Jogar</button>"
                        Session("idPet") = valor
                        linha.Cells.Add(coluna)
                    Else
                        coluna = New TableCell
                        coluna.Text = valor
                        linha.Cells.Add(coluna)
                    End If

                    cont = cont + 1
                Next
                tabela.Rows.Add(linha)
                linha = New TableRow
            Next
            form1.Controls.Add(tabela)
        Else
            Dim fs As FileStream = File.Create(arqPets)
            Dim info As Byte() = New UTF8Encoding(True).GetBytes("null")
            fs.Write(info, 0, info.Length)
            fs.Close()
            aviso.Text = "Não pets cadastrados"
            form1.Controls.Add(aviso)
        End If
    End Sub

End Class