class Patient
  attr_reader :name 

  @@all = []

  def initialize(name)
    @name = name 
    @@all << self 
  end

  def self.all 
    @@all
  end

  def new_appointment(doctor, date)
    appointment = Appointment.new(date, self, doctor)
    appointment
  end

  def appointments
    Appointment.all.select { |app| app.patient == self }
  end

  def doctors
    self.appointments.map { |app| app.doctor }
  end
end