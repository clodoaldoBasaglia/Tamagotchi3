<%@Import Namespace="GameSolution"%>
<%@Register Assembly="AjaxControlToolkit"  Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit"%>
<%@Import Namespace="System.Drawing"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
        <head id="Head1" runat="server">
            <title>Virtual Pet</title>
            <style type="text/css">
            </style>
        </head>

        <body style="height: 380px; width: 510px; text-align: center;">
            <form id="form1" runat="server">
                <asp:Panel ID="PanelActions" runat="server" style="position:absolute; top: 326px; left: 15px; width: 315px; height: 65px;">
                    <asp:Button ID="Play"       runat="server" OnClick="ButtonPlay_Click"   style="position:absolute; top: 35px; height: 22px; width: 46px; left: 126px;" Text="Play" />
                    <asp:Button ID="Cure"       runat="server" OnClick="ButtonCure_Click"   style="position:absolute; top: 35px; height: 22px; width: 46px; left: 63px;" Text="Cure" />
                    <asp:Button ID="Lights"     runat="server" OnClick="ButtonLights_Click" style="position:absolute; top: 35px; height: 22px; width: 46px; left: 190px;" Text="Lights" />
                    <asp:Button ID="Button1"    runat="server" OnClick="ButtonFeed_Click"   style="position:absolute; top: 35px; height: 22px; width: 46px; left: 252px;" Text="Feed" />
                    <asp:Button ID="Flush"      runat="server" OnClick="ButtonFlush_Click"  style="position:absolute; top: 35px; height: 22px; width: 46px; left: 5px ;" Text="Flush"  />
                </asp:Panel>
    
                <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
                </asp:ScriptManager>

                <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
                </asp:ScriptManagerProxy>

                <asp:Panel ID="PanelImage" runat="server" style="position:absolute; top: 109px; left: 24px; height: 190px; width: 482px;">
                    <asp:UpdatePanel ID="UpdatePanelImage" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Timer ID="Timer2" runat="server" Interval="1000" ></asp:Timer>

                            

                            <asp:Image ID="Image1" runat="server" style="position:absolute; top: 7px; left: 113px; height: 175px; width: 177px;"/> 
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                
               

                <asp:UpdatePanel ID="PanelStatus" runat="server" style="position:absolute; top: 320px; left: 334px; width: 179px;" UpdateMode="Conditional" >
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" Interval="5000" ></asp:Timer>
                    
                        <asp:Label ID="LabelHappy"      runat="server" Text="Happy" style="position:absolute; top: -9px; left: 5px; height: 2px; width: 1px;" Font-Size="Small"></asp:Label>
                        <asp:TextBox ID="BoxHappy"      runat="server" style="position:absolute; top: -12px; left: 54px; width: 32px;" OnLoad="TextBoxHappy_TextChanged"></asp:TextBox>    
        
                        <asp:Label ID="LabelHunger"     runat="server" Text="Hunger" style="position:absolute; top: 23px; left: 5px;" Font-Size="Small"></asp:Label>
                        <asp:TextBox ID="BoxHunger"     runat="server" style="position:absolute; top: 18px; left: 54px; width: 32px;" OnLoad="TextBoxHunger_TextChanged"></asp:TextBox> 

                        <asp:Label ID="LabelHealth"     runat="server" Text="Health" style="position:absolute; top: 54px; left: 5px;" Font-Size="Small"></asp:Label>
                        <asp:TextBox ID="BoxHealth"     runat="server" style="position:absolute; top: 50px; left: 54px; width: 32px;" OnLoad="TextBoxHealth_TextChanged"></asp:TextBox>
            
                        <asp:Label ID="LabelEnergy"     runat="server" Text="Energy" style="position:absolute; top: -9px; left: 100px; height: 2px; width: 1px;" Font-Size="Small"></asp:Label>
                        <asp:TextBox ID="BoxEnergy"     runat="server" style="position:absolute; top: -12px; left: 148px; width: 32px;" OnLoad="TextBoxEnergy_TextChanged"></asp:TextBox>    
                    
                        <asp:Label ID="LabelToilet"     runat="server" Text="Toilet" style="position:absolute; top: 23px; left: 100px;" Font-Size="Small"></asp:Label>
                        <asp:TextBox ID="BoxToilet"     runat="server" style="position:absolute; top: 19px; left: 148px; width: 32px;" OnLoad="TextBoxToilet_TextChanged"></asp:TextBox>    
                        <asp:Label ID="idpet" runat="server" Text="Toilet"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>    

        

            <script runat="server">
                Dim person As New Personagem()
                Dim aTimer As New System.Timers.Timer()
                Dim ListImagesPerson As New List(Of String)()

                Protected Sub ButtonFeed_Click(sender As Object, e As EventArgs)
                    If person.GetSleeping = False Then
                        Dim aux_hunger As Integer = person.GetHunger()
                        Dim aux_energy As Integer = person.GetEnergy()
                        Dim aux_health As Integer = person.GetHealth()

                        aux_hunger -= CInt(Math.Ceiling(Rnd() * 10)) + 1
                        aux_energy -= CInt(Math.Ceiling(Rnd() * 25)) + 1

                        If aux_hunger < 0 Then
                            aux_hunger = 0
                            aux_health -= 3
                        End If

                        If aux_energy < 1 Then
                            aux_energy = 0
                        End If

                        person.SetHealth(aux_health)
                        person.SetHunger(aux_hunger)
                        person.SetEnergy(aux_energy)

                        PanelStatus.Update()
                    End If
                End Sub

                Protected Sub ButtonFlush_Click(sender As Object, e As EventArgs)
                    If person.GetSleeping = False Then
                        Dim aux_health As Integer = person.GetHealth()
                        Dim aux_energy As Integer = person.GetEnergy()
                        Dim aux_toilet As Integer = person.GetToilet()

                        aux_energy -= CInt(Math.Ceiling(Rnd() * 10)) + 1



                        If aux_energy < 1 Then
                            aux_energy = 0
                        End If

                        If aux_toilet < 10 Then
                            aux_toilet = 0
                            aux_health -= 9
                        Else
                            aux_toilet -= CInt(Math.Ceiling(Rnd() * 60)) + 50
                            aux_health += 2

                            If aux_toilet < 0 Then
                                aux_toilet = 0
                            End If

                            If aux_health > 100 Then
                                aux_health = 100
                            End If


                        End If

                        person.SetEnergy(aux_energy)
                        person.SetHealth(aux_health)
                        person.SetToilet(aux_toilet)
                        PanelStatus.Update()
                    End If
                End Sub

                Protected Sub ButtonPlay_Click(sender As Object, e As EventArgs)
                    If person.GetSleeping = False Then
                        Dim aux_happy As Integer = person.GetHappy()
                        Dim aux_energy As Integer = person.GetEnergy()
                        Dim aux_hunger As Integer = person.GetHunger()
                        Dim aux_toilet As Integer = person.GetToilet()
                        Dim aux_health As Integer = person.GetHealth()

                        aux_happy += CInt(Math.Ceiling(Rnd() * 10)) + 1
                        aux_energy -= CInt(Math.Ceiling(Rnd() * 10)) + 1
                        aux_hunger += CInt(Math.Ceiling(Rnd() * 10)) + 1
                        aux_toilet += CInt(Math.Ceiling(Rnd() * 10)) + 1

                        If aux_happy > 100 Then
                            aux_happy = 100
                            aux_health -= 3
                        End If

                        If aux_energy < 0 Then
                            aux_energy = 0
                        End If

                        If aux_hunger > 100 Then
                            aux_hunger = 100
                        End If

                        person.SetHealth(aux_health)
                        person.SetHappy(aux_happy)
                        person.SetEnergy(aux_energy)
                        person.SetHunger(aux_hunger)
                        person.SetToilet(aux_toilet)
                        PanelStatus.Update()
                    End If
                End Sub

                Protected Sub ButtonCure_Click(sender As Object, e As EventArgs)
                    If person.GetSleeping = False Then
                        Dim aux_health As Integer = person.GetHealth()

                        aux_health += CInt(Math.Ceiling(Rnd() * 10)) + 1

                        If aux_health > 100 Then
                            aux_health = 100
                        End If

                        person.SetHealth(aux_health)
                        PanelStatus.Update()
                    End If
                End Sub

                Protected Sub ButtonLights_Click(sender As Object, e As EventArgs)
                    Dim aux_sleep As Boolean = person.GetSleeping()

                    If aux_sleep = True Then
                        aux_sleep = False
                        PanelImage.BackColor = System.Drawing.Color.Yellow
                        Image1.ImageUrl = "~/GameImagens/emoticon-happy.png"
                    Else
                        aux_sleep = True
                        PanelImage.BackColor = System.Drawing.Color.DarkGray
                        Image1.ImageUrl = "~/GameImagens/emoticon-sleeping.png"
                    End If

                    person.SetSleeping(aux_sleep)
                    SetStatus_PersonagemImage()
                    PanelStatus.Update()
                End Sub

                Protected Sub Page_Load(sender As Object, e As EventArgs)
                    Dim i As String = Session("idPet")

                    idpet.Text = i
                    Dim ap As New AcessaPets
                    Dim pet As String = ap.pegaPets(i)

                    pet = pet.Replace("[", "")
                    pet = pet.Replace("]", "")
                    idpet.Text = pet
                    Dim dados() As String = pet.Split(";")
                    Dim auxiliar As New Personagem
                    auxiliar.SetHappy(CInt(dados.GetValue(0)))
                    auxiliar.SetHunger(CInt(dados.GetValue(1)))
                    auxiliar.SetHealth(CInt(dados.GetValue(2)))
                    auxiliar.SetEnergy(CInt(dados.GetValue(3)))
                    auxiliar.SetToilet(CInt(dados.GetValue(4)))
                    If dados.GetValue(5) = "False" Then
                        auxiliar.SetSleeping(False)
                    Else
                        auxiliar.SetSleeping(True)
                    End If

                    person = auxiliar
                    If person.GetSleeping = False Then
                        PanelImage.BackColor = System.Drawing.Color.Yellow
                    Else
                        PanelImage.BackColor = System.Drawing.Color.DarkGray
                    End If

                    SetStatus_PersonagemImage()
                End Sub

                Protected Sub TextBoxHappy_TextChanged(sender As Object, e As EventArgs)
                    BoxHappy.Text = person.GetHappy()
                End Sub

                Protected Sub TextBoxHunger_TextChanged(sender As Object, e As EventArgs)
                    BoxHunger.Text = person.GetHunger()
                End Sub

                Protected Sub TextBoxHealth_TextChanged(sender As Object, e As EventArgs)
                    BoxHealth.Text = person.GetHealth()
                End Sub

                Protected Sub TextBoxEnergy_TextChanged(sender As Object, e As EventArgs)
                    BoxEnergy.Text = person.GetEnergy()
                End Sub

                Protected Sub TextBoxToilet_TextChanged(sender As Object, e As EventArgs)
                    BoxToilet.Text = person.GetToilet()
                End Sub

                Protected Sub VerifyConditions_Personagem()
                    Dim aux_happy As Integer = person.GetHappy()
                    Dim aux_hunger As Integer = person.GetHunger()
                    Dim aux_health As Integer = person.GetHealth()
                    Dim aux_energy As Integer = person.GetEnergy()
                    Dim aux_toilet As Integer = person.GetToilet()
                    Dim aux_sleeping As Boolean = person.GetSleeping()

                    If aux_sleeping = False Then
                        If aux_happy <= 25 Then
                            aux_health -= 1
                        End If

                        If aux_hunger >= 85 Then
                            aux_health -= 2
                        End If

                        If aux_energy <= 9 Then
                            aux_health -= 1
                        End If

                        If aux_toilet >= 85 Then
                            aux_health -= 1
                        End If

                        person.SetHealth(aux_health)
                    End If

                End Sub


                Protected Sub SetStatus_PersonagemImage()
                    Dim aux_happy As Integer = person.GetHappy()
                    Dim aux_hunger As Integer = person.GetHunger()
                    Dim aux_health As Integer = person.GetHealth()
                    Dim aux_energy As Integer = person.GetEnergy()
                    Dim aux_toilet As Integer = person.GetToilet()
                    Dim aux_sleeping As Boolean = person.GetSleeping()

                    If aux_health > 0 Then
                        If aux_sleeping = False Then

                            If aux_happy < 30 Or aux_hunger > 75 Or aux_health < 30 Or aux_energy < 30 Or aux_toilet > 75 Then
                                If aux_health < 30 Then
                                    ListImagesPerson.Add("~/GameImagens/emoticon-sick.png")
                                    BoxHealth.BackColor = System.Drawing.Color.Red
                                Else
                                    BoxHealth.BackColor = System.Drawing.Color.White
                                End If

                                If aux_energy < 30 Then
                                    ListImagesPerson.Add("~/GameImagens/emoticon-tired.png")
                                    BoxEnergy.BackColor = System.Drawing.Color.Red
                                Else
                                    BoxEnergy.BackColor = System.Drawing.Color.White
                                End If

                                If aux_happy < 30 Then
                                    ListImagesPerson.Add("~/GameImagens/emoticon-sad.png")
                                    BoxHappy.BackColor = System.Drawing.Color.Red
                                Else
                                    BoxHappy.BackColor = System.Drawing.Color.White
                                End If

                                If aux_hunger > 75 Then
                                    ListImagesPerson.Add("~/GameImagens/emoticon-hunger.png")
                                    BoxHunger.BackColor = System.Drawing.Color.Red
                                Else
                                    BoxHunger.BackColor = System.Drawing.Color.White
                                End If

                                If aux_toilet > 75 Then
                                    ListImagesPerson.Add("~/GameImagens/emoticon-dirty.png")
                                    BoxToilet.BackColor = System.Drawing.Color.Red
                                Else
                                    BoxToilet.BackColor = System.Drawing.Color.White
                                End If
                            Else
                                ListImagesPerson.Add("~/GameImagens/emoticon-happy.png")
                            End If
                        End If
                    Else
                        Image1.ImageUrl = "~/GameImagens/emoticon-dead.png"
                    End If

                    VerifyConditions_Personagem()
                    UpdatePanelImage.Update()

                End Sub


                Protected Sub Timer_Tick2(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer2.Tick
                    If ListImagesPerson.Count > 0 Then

                        Dim rnd = New Random()
                        Dim randomStatus = ListImagesPerson(rnd.Next(0, ListImagesPerson.Count))


                        ListImagesPerson.Clear()


                        Image1.ImageUrl = randomStatus
                        UpdatePanelImage.Update()
                    End If
                End Sub


                Protected Sub Timer_Tick1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick
                    Dim aux_happy As Integer = person.GetHappy()
                    Dim aux_hunger As Integer = person.GetHunger()
                    Dim aux_health As Integer = person.GetHealth()
                    Dim aux_energy As Integer = person.GetEnergy()
                    Dim aux_toilet As Integer = person.GetToilet()
                    Dim aux_sleeping As Boolean = person.GetSleeping()

                    aux_happy -= 1
                    aux_hunger += 1
                    aux_health -= 1
                    aux_toilet += 1

                    If aux_sleeping = True Then
                        aux_energy += 5
                        aux_health += 3
                        aux_happy -= 1
                    Else
                        aux_energy -= 1
                    End If

                    If aux_happy < 0 Then
                        aux_happy = 0
                    End If

                    If aux_hunger > 100 Then
                        aux_hunger = 100
                    End If

                    If aux_health < 0 Then
                        aux_health = 0
                    End If

                    If aux_energy < 0 Then
                        aux_energy = 0
                    End If

                    If aux_toilet > 100 Then
                        aux_toilet = 100
                    End If

                    person.SetHappy(aux_happy)
                    person.SetHunger(aux_hunger)
                    person.SetHealth(aux_health)
                    person.SetEnergy(aux_energy)
                    person.SetToilet(aux_toilet)

                    SetStatus_PersonagemImage()

                    PanelStatus.Update()
                End Sub
            </script>
        </form>
    </body>
</html>


