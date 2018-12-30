require 'load'

FILE_NAME='./storage.yml'.freeze

RSpec.describe Load do
  let(:dummy_class) { Class.new { extend Load } }

  it 'when load_all_documents' do
    allow(dummy_class).to receive(:load_all_documents).with(FILE_NAME).and_call_original
    list=dummy_class.load_all_documents(FILE_NAME)
    puts list, list.class, list.size
    expect(dummy_class.load_all_documents(FILE_NAME)).to be_instance_of(Array)
  end

  it 'when use `load` ' do
    allow(dummy_class).to receive(:load).with(FILE_NAME).and_call_original
    list=dummy_class.load(FILE_NAME)
    puts list, list.class, list.size
    expect(dummy_class.load(FILE_NAME)).to be_instance_of(Hash)
  end
  it 'when use `load_documents` ' do
    allow(dummy_class).to receive(:load_documents).with(FILE_NAME).and_call_original
    list=dummy_class.load_documents(FILE_NAME)
    puts list, list.class, list.size
    expect(dummy_class.load_documents(FILE_NAME)).to be_instance_of(Array)
  end
  it 'when use `load_file` ' do
    allow(dummy_class).to receive(:load_as_file).with(FILE_NAME).and_call_original
    list=dummy_class.load_as_file(FILE_NAME)
    puts list, list.class, list.size
    expect(dummy_class.load_as_file(FILE_NAME)).to be_instance_of(Hash)
  end
  it 'when use `load_stream` ' do
    allow(dummy_class).to receive(:load_as_stream).with(FILE_NAME).and_call_original
    list=dummy_class.load_as_stream(FILE_NAME)
    puts list, list.class, list.size
    puts list[0]["user_name"]
    puts list[1]["user_name"]
    expect(dummy_class.load_as_stream(FILE_NAME)).to be_instance_of(Array)
  end
  it 'when use `load_to_string` ' do
    allow(dummy_class).to receive(:load_to_string).with(FILE_NAME).and_call_original
    list=dummy_class.load_to_string(FILE_NAME)
    puts list, list.class, list.size
    expect(dummy_class.load_to_string(FILE_NAME)).to be_instance_of(String)
  end
end
