$(document).ready(function(){
  $('.flame_thumb').on('click', function(){
    var _self = $(this);
    _self.closest('div.row').find('a.selected').removeClass('selected');
    _self.addClass('selected');
    var flame_id = _self.attr("id").replace(/flame/g, '');
    var next_btn = $('input.next_btn');
    $('input#flame_id').val(flame_id);
    next_btn.removeAttr('disabled');
  });
});
