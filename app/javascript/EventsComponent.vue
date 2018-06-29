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
            <form  @submit.prevent="createEvent">
              <div class="form-group">
                <label for="title">Title</label>
                <input class="form-control" id="title" name="event[title]" type="text" v-model="newEvent.title">
              </div>
              <div class="form-group">
                <label for="duration">Duration (min)</label>
                <input class="form-control" id="duration"
                       name="event[duration]" type="number" step="30" v-model="newEvent.duration">
              </div>
              <input class="btn btn-secondary" name="commit" type="submit" value="Create">
            </form>
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
  import moment from 'moment';

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
          eventDurationEditable: false,

          dayClick: function(date, jsEvent, view) {
            $('#eventModal').modal('toggle');
            $(this).trigger("NewEventClick", [date]);
          }
        },
        newEvent: { title: "", duration: 30, start: undefined }
      }
    },
    methods: {
      createEvent: function() {
        let title = this.newEvent.title;
        let start = moment(this.newEvent.start);
        let end = start.add(30, 'minutes');

        start = start.format();
        end = end.format();

        let event = { title: title, start: start, end: end };

        axios.post('events.json', { event: event })
          .then((response) => {
            console.log(response.data)
          })
          .error(e => { console.error('ERROR ' + e) });
      }
    },
    mounted: function() {
      let _this = this;
      $(document).on("NewEventClick", function (event, date) {
        _this.newEvent.start = date;
      });
    }
  }
</script>

<style lang="scss">
  @import '../../node_modules/fullcalendar/dist/fullcalendar.css';
  @import '../../node_modules/bootstrap/scss/bootstrap.scss';
</style>
