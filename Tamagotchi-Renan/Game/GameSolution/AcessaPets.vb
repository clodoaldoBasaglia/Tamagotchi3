
Imports System
Imports System.IO
Imports System.Text
Public Class AcessaPets
    Public Function soVetor(ByVal vetor)
        Dim words() As String = vetor.Split(",")
        Return words.GetValue(words.Length - 1)
    End Function
    Public Function pegaPets(ByVal id)
        Dim path As String = "C:\teste\listaDePets.txt"
        Dim listaPets As New ArrayList
        Dim aux As String

        If File.Exists(path) Then

            Dim sr As StreamReader = File.OpenText(path)
            Do While sr.Peek() >= 0
                aux = sr.ReadLine()
                listaPets.Add(aux)
                '    Debug.WriteLine(aux)
            Loop
            For Each aux In listaPets
                Dim words() As String = aux.Split(",")
                Dim cont As Integer = 0
                For Each valor In words
                    If (cont = 2) Then
                        If (id = valor.Trim) Then
                            Return soVetor(aux)
                        End If
                    End If
                    cont = cont + 1
                Next
            Next
        End If
        Return Nothing
    End Function

End Class
