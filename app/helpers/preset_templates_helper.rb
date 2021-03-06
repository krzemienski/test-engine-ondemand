module PresetTemplatesHelper
  def preset_types_for_select
    PresetTemplate.preset_types.each_with_index.map { |p, i| [ PresetTemplate::HUMAN_READABLE_PRESET_TYPES[i], p[0] ] }
  end
  
  def human_readable_preset_type(preset)
    PresetTemplate::HUMAN_READABLE_PRESET_TYPES[preset.attributes['preset_type']]
  end
  
  def formatted_preset_template_text(text)
    text.gsub(/\@(.*?)\@/, '<span class="label label-info" data-variable="\1">\1</span>').html_safe
  end
end
