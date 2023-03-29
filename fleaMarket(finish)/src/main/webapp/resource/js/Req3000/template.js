//템플릿
  
    if (document.getElementById('editor')) {
      var quill = new Quill('#editor', {
        theme: 'snow' // Specify theme in configuration
      });
    }

    if (document.getElementById('choices-multiple-remove-button')) {
      var element = document.getElementById('choices-multiple-remove-button');
      const example = new Choices(element, {
        removeItemButton: true
      });

      example.setChoices(
        [{
            value: 'One',
            label: 'Label One',
            disabled: true
          },
          {
            value: 'Two',
            label: 'Label Two',
            selected: true
          },
          {
            value: 'Three',
            label: 'Label Three'
          },
        ],
        'value',
        'label',
        false,
      );
    }

    if (document.querySelector('.datetimepicker')) {
      flatpickr('.datetimepicker', {
        allowInput: true
      }); // flatpickr

   
    }

    
    
    Dropzone.autoDiscover = false;
    var drop = document.getElementById('dropzone')
    var myDropzone = new Dropzone(drop, {
      url: "/file/post",
      addRemoveLinks: true

    });