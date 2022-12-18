Imports System.CodeDom
Imports System.ComponentModel
Imports System.Web.Compilation
Imports System.Web.Configuration
Imports System.Configuration

''' <summary>
''' Class that enables the creation of expressions containing the current theme or stylesheet theme as set in 
''' the <c>pages</c> section of web.config.
''' </summary>
''' <remarks>
''' <para>The following two types of expressions are supported:
'''	1. <c>&lt;%$ Themes:StylesheetTheme %&gt;</c> or
''' 2. <c>&lt;%$ Themes:StylesheetTheme(&lt;some format string&gt;) %&gt;</c>, where <c>&lt;some format 
''' string&gt;</c> can contain one placeholder, such as '~/App_Themes/{0}/Images/someimage.gif'.</para>''' 
''' <para>You can query both the <c>StyleSheetTheme</c> and <c>Theme</c> properties. The respective expressions
''' are <c>&lt;%$ Themes:StylesheetTheme %&gt;</c> and <c>&lt;%$ Themes:Theme %&gt;</c>.</para>
''' </remarks>
<ExpressionPrefix("Themes")> _
Public Class ThemesExpressionBuilder
    Inherits System.Web.Compilation.ExpressionBuilder

    Private Const STYLESHEET_THEME As String = "stylesheettheme"
    Private Const THEME As String = "theme"

    Public Overrides Function GetCodeExpression(ByVal entry As System.Web.UI.BoundPropertyEntry, ByVal parsedData As Object, ByVal context As System.Web.Compilation.ExpressionBuilderContext) As System.CodeDom.CodeExpression

        Dim expressionArray(0) As CodeExpression
        expressionArray(0) = New CodePrimitiveExpression(entry.Expression.Trim())

        Return New CodeMethodInvokeExpression(New CodeTypeReferenceExpression(MyBase.GetType()), "GetEvalData", expressionArray)

    End Function

    Public Overrides ReadOnly Property SupportsEvaluate() As Boolean
        Get
            Return True
        End Get
    End Property

    Public Overrides Function EvaluateExpression(ByVal target As Object, ByVal entry As System.Web.UI.BoundPropertyEntry, ByVal parsedData As Object, ByVal context As System.Web.Compilation.ExpressionBuilderContext) As Object

        Return GetEvalData(entry.Expression)

    End Function

    Public Shared Function GetEvalData(ByVal expression As String) As Object

        Dim result As String = String.Empty

        ' Get the Web application configuration.
        Dim config As Configuration = WebConfigurationManager.OpenWebConfiguration("~")

        ' Get the 'pages' section.
        Dim pagSection As PagesSection = CType(config.GetSection("system.web/pages"), PagesSection)

        Dim hasArgs As Boolean = System.Text.RegularExpressions.Regex.IsMatch(expression, ".+\(.+\)", RegexOptions.IgnorePatternWhitespace Or RegexOptions.Compiled Or RegexOptions.IgnoreCase)

        'Determine the expression result
        If expression.ToLowerInvariant().StartsWith(STYLESHEET_THEME) Then

            If hasArgs Then

                expression = expression.Substring(STYLESHEET_THEME.Length + 1, expression.Length - STYLESHEET_THEME.Length - 2)
                Dim helper As System.Web.UI.Control = New Control()
                result = helper.ResolveUrl(String.Format(expression, pagSection.StyleSheetTheme))

            Else

                result = pagSection.StyleSheetTheme

            End If

        ElseIf expression.ToLowerInvariant().StartsWith(THEME) Then

            If hasArgs Then

                expression = expression.Substring(THEME.Length + 1, expression.Length - THEME.Length - 2)
                Dim helper As System.Web.UI.Control = New Control()
                result = helper.ResolveUrl(String.Format(expression, pagSection.Theme))

            Else

                result = pagSection.Theme

            End If
        End If

        Return result

    End Function
End Class