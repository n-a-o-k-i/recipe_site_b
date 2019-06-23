$ ->
  el = document.getElementById("sortable_list")
  if el != null
    sortable = Sortable.create(el, delay: 200)
    handle: '.glyphicon-move'

  el2 = document.getElementById("sortable_list2")
  if el != null
    sortable = Sortable.create(el2, delay: 200)
    handle: '.glyphicon-move'