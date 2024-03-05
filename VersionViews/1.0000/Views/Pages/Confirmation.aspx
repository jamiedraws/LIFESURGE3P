<%@ Page Language="C#"  %>

    <% Html.BeginForm(); %>
    <input type="hidden" name="createOrder" value="true" />
    <% Html.EndForm(); %>
<script>
    document.getElementsByTagName("form")[0].submit();
</script>
