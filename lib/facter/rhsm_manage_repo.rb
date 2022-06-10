Facter.add('rhsm_manage_repo') do
  confine operatingsystem: 'RedHat'
  setcode do
    rhsm_result = Facter::Util::Resolution.exec('subscription-manager config --list  | grep manage_repos | awk \'{ print $NF}\'')
    case rhsm_result
    when '0', '[0]'
      false
    when '1', '[1]'
      true
    else
      Facter.warn('Problem detecting rhsm_manage_repo')
      'Error'
    end
  end
end
