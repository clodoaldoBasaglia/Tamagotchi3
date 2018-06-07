Public Class Personagem

    Private Shared Name As String                   'nome do pet virtual
    Private Shared Happy As Integer = 80            'barra de felicidade
    Private Shared Hunger As Integer = 5           'barra de fome
    Private Shared Health As Integer = 90           'barra de saude
    Private Shared Energy As Integer = 90           'barra de saude
    Private Shared Toilet As Integer = 5           'barra de sujeira
    Private Shared Sleeping As Boolean = False      'pode dormir ou acordar a qualquer momento



    'funçoes de getters e setters
    Public Function GetName()
        Return Name
    End Function

    Public Function GetHappy()
        Return Happy
    End Function

    Public Function SetHappy(ByVal value_happy)
        Happy = value_happy
    End Function

    Public Function GetHunger()
        Return Hunger
    End Function

    Public Function SetHunger(ByVal value_hunger)
        Hunger = value_hunger
    End Function

    Public Function GetHealth()
        Return Health
    End Function

    Public Function SetHealth(ByVal value_health)
        Health = value_health
    End Function

    Public Function GetEnergy()
        Return Energy
    End Function

    Public Function SetEnergy(ByRef value_energy)
        Energy = value_energy
    End Function

    Public Function GetSleeping()
        Return Sleeping
    End Function

    Public Function SetSleeping(ByVal value_sleeping)
        Sleeping = value_sleeping
    End Function

    Public Function GetToilet()
        Return Toilet
    End Function

    Public Function SetToilet(ByVal value_toilet)
        Toilet = value_toilet
    End Function
End Class
