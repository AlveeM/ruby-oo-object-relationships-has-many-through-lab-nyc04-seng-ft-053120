class Doctor
  attr_reader :name 

  @@all = []

  def initialize(name)
    @name = name 
    @@all << self 
  end

  def new_appointment(patient, date)
    appointment = Appointment.new(date, patient, self)
    appointment
  end

  def appointments
    Appointment.all.select { |app| app.doctor == self }
  end

  def patients
    self.appointments.map { |app| app.patient }
  end

  def self.all 
    @@all
  end
end