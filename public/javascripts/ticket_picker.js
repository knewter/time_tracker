// when client is changed, populate the projects
$("#client_id").live('change', function(){
  // Remove the project select tag and the ticket select tag, if they exist
  var project_div = $("#project");
  var ticket_div  = $("#ticket");
  project_div.html('');
  ticket_div.html('');
  // Now make the new project selector, inside the #project div
  var label = $("<p></p>").text("Project");
  var me = $("<select></select><br />").attr('id', 'project_id').attr('name', 'project_id');
  project_div.append(label).append(me);
  me.children().remove();
  me.append( new Option("Select a project","") )
  if(this.value != "") {
    $.get("/ticket_picker", { client_id: this.value }, function(data){
      $.each(data, function(){
        $.each(this, function(k, v){
          me.append( new Option(v.name, v.id) )
        });
      });
    }, "json");
  }
});

// when project is changed, populate the tickets
$("#project_id").live('change', function(){
  // Remove the ticket select tag, if it exists
  var ticket_div = $("#ticket");
  ticket_div.html('');
  // Now make the new ticket selector, inside the #ticket div
  var label = $("<p></p>").text("Ticket");
  var me = $("<select></select><br />").attr('id', 'ticket_id').attr('name', 'ticket_id');
  ticket_div.append(label).append(me);
  me.children().remove();
  me.append( new Option("Select a ticket","") )
  if(this.value != "") {
    $.get("/ticket_picker", { client_id: $('#client_id').val(), project_id: this.value }, function(data){
      $.each(data, function(){
        $.each(this, function(k, v){
          me.append( new Option(v.name, v.id) )
        });
      });
    }, "json");
  }
});
