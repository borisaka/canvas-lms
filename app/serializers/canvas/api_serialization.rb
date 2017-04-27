#
# Copyright (C) 2014 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

module Canvas
  module APISerialization
    def stringify!(hash)
      return hash unless stringify_ids?
      StringifyIds.stringify_ids(hash)
      if (links = hash['links']).present?
        links.each do |key, value|
          next if value.nil?
          links[key] = value.is_a?(Array) ? value.map(&:to_s) : value.to_s
        end
      end
      hash
    end

    def stringify_ids?
      true
    end
  end
end
