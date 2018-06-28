<template>

  <div class="container">
    <full-calendar :eventSources="eventSources" :config="config"></full-calendar>
    <!-- The Modal -->
    <div class="modal" id="eventModal">
      <div class="modal-dialog">
        <div class="modal-content">

          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">Add new Event</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            Modal body..
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          </div>

        </div>
      </div>
    </div>

  </div>

</template>

<script>
  import { FullCalendar } from 'vue-full-calendar'
  import axios from 'axios';
  import 'bootstrap/dist/js/bootstrap';

  export default {
    components: {
      FullCalendar
    },

    data: () => {
      return {
        eventSources: [
          {
            events(start, end, timezone, callback) {
              axios.get(`/events.json`).then(response => {
                callback(response.data);
              })
            },
            color: '',
            textColor: 'black'
          }
        ],

        config: {
          dayClick: function(date, jsEvent, view) {
            $('#eventModal').modal('toggle')
          }
        }
      }
    }
  }
</script>

<style lang="scss">
  @import '../../node_modules/fullcalendar/dist/fullcalendar.css';
  @import '../../node_modules/bootstrap/scss/bootstrap.scss';
</style>
