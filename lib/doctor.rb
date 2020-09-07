class Doctor

    attr_accessor :name # has a name

    @@all = []

    def initialize(name) # initializes with a name and adds itself to an array of all doctors
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(patient, date) # given a date and a patient, creates a new appointment. pay attention to the specs. how the arguments are ordered
        Appointment.new(date, patient, self)
    end

    def appointments # returns all appointments associated with this Doctor
        Appointment.all.select {|appointment| appointment.doctor == self}
    end

    def patients # has many patients, through appointments
        self.appointments.map {|appointment| appointment.patient}
    end
end